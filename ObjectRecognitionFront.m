function output = ObjectRecognitionFront(train_frequency, test_frequency)
%{
This is going to be the frontend of the code which will call all the
necessary functions and perform the final operation of object recognition.
%}
%% Loading the data and dividing into making the training, testing and validation set
%{
[dataArray_matrix, labels_vector, labelNames] = loadData(); % this also normalised the value of the data matrix
[test_Matrix, train_Matrix, valid_Matrix, test_label_vector, train_label_vector, valid_label_vector] = test_train_validation_set_maker(dataArray_matrix, labels_vector, train_frequency, test_frequency);
clearvars dataArray_matrix labels_vector train_frequency test_frequency; 
%}
% Uncomment the above multiline comment during final deployment
load("miniloaded_data.mat") % Comment this section out for final deployment
%% Initial weight vector and bias vector and hyperparameters
%W = rand(size(labelNames,1), size(train_Matrix(1,:),2)) * 0.0001;
bias_vector = zeros(size(labelNames,1),1); % just making it zero for now, will change later for better performance
Lambda = 10^-5; % just making this randomly
delta = 1.0;
learning_rate = 0.0001;
num_iter = 500;
batch_size = 256;
training_weights = trainModelSVM(train_label_vector, train_Matrix, bias_vector, delta, Lambda, batch_size, num_iter, learning_rate);
[train_accuracy, test_accuracy] = testModel(training_weights, train_Matrix, train_label_vector, test_Matrix, test_label_vector);
%%% IMPORTANT: The results of my numerical and analytical gradients are not
%%% same. I am doing something wrong somewhere for sure.

%% Simply print the results once 
"accuracy in training dataset: " 
train_accuracy
"accuracy in testing dataset: "
test_accuracy
%% 
showTemplateImagesOfCurrentWeightMatrix(W,labelNames);

end