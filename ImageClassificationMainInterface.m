%% Clear the Workspace beforehand
clear
%% Load the Data
train_frequency = 0.65;
test_frequency = 0.15;
[dataArray_matrix, labels_vector, labelNames] = loadData(); % this also normalised the value of the data matrix
[test_Matrix, train_Matrix, valid_Matrix, test_label_vector, train_label_vector, valid_label_vector] = test_train_validation_set_maker(dataArray_matrix, labels_vector, train_frequency, test_frequency);
clearvars dataArray_matrix labels_vector train_frequency test_frequency; 
% save('loaded_data.mat')
%% Sort 5 images in each class and sort them
pic_weights = zeros(size(labelNames,1), size(train_Matrix(1,:),2));
j = 1;
for i=1:10
    while train_label_vector(j) ~= i
        j = j + 1;
    end
    pic_weights(i,:) = train_Matrix(j,:);
end
%showTemplateImagesOfCurrentWeightMatrix(pic_weights,labelNames);
%% Fine - Tune the hyperparameters
output_matrix = [];
learning_rates = [7.5*10^-4, 9*10^-4, 10^-3, 1.1*10^-3, 2.5*10^-3];
Lambdas = [10^-4, 7.5*10^-5, 6.25*10^-5, 5*10^-5, 3.5*10^-5, 2.5*10^-5];
for i=(1:length(learning_rates))
    for j=(1:length(Lambdas))
        learning_rate = learning_rates(i);
        Lambda = Lambdas(j);
        batch_size = 128;
        num_iter = 500 ;
        plotting = false;
        train_valid_vector_weights = ObjectRecognitionFront(train_Matrix, valid_Matrix, train_label_vector, valid_label_vector, labelNames, learning_rate, batch_size, num_iter, Lambda, plotting);
        this_output = [learning_rate, Lambda, train_valid_vector_weights{1, 1}(1), train_valid_vector_weights{1, 1}(2)];
        output_matrix = [output_matrix; this_output];
    end
end
%% Choosing the best hyperparameters
best_validation_score = max(output_matrix(:,4));
for row=1:length(output_matrix)
    if best_validation_score == output_matrix(row,4)
        learning_rate = output_matrix(row,1);
        Lambda = output_matrix(row,2);
    end
end
%% Doing the actual training
batch_size = 256;
num_iter = 1000;
plotting = true;
training_output = ObjectRecognitionFront(train_Matrix, valid_Matrix, train_label_vector, valid_label_vector, labelNames, learning_rate, batch_size, num_iter, Lambda, plotting);
training_accuracy = training_output{1, 1}(1);
validation_accuracy = training_output{1, 1}(2);
training_weights = training_output{2, 1};
%% Check the accuracy on Test Data Set 
test_accuracy = FINALtestModel(training_weights, test_Matrix, test_label_vector)
%% Showing the weights in terms of pictures
showTemplateImagesOfCurrentWeightMatrix(training_weights,labelNames);
%% Save the model for deployment later
save DeployableModelWeights.mat training_weights

%% ************************************************************************ %%
%% ************************************************************************ %%
%% Random Deployment
%% Load the deployable data
load DeployableModelWeights.mat
for i=(1:5)
    number = int8(100 * rand());
    DeployModel(training_weights,test_Matrix(number,:),labelNames(test_label_vector(number)));
end











