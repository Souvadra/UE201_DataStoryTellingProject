function output = ObjectRecognitionFront(train_Matrix, valid_Matrix, train_label_vector, valid_label_vector, labelNames, learning_rate, batch_size, num_iter, Lambda, plotting)
%{
%}
%% Initial weight vector and bias vector and hyperparameters
W = rand(size(labelNames,1), size(train_Matrix(1,:),2)) * 0.0001;
bias_vector = zeros(size(labelNames,1),1); % just making it zero for now, will change later for better performance
% Lambda = 10^-5; % just making this randomly
delta = 1.0;
% learning_rate = 0.0001;
% num_iter = 1500;
% batch_size = 256;
training_weights = trainModelSVM(train_label_vector, train_Matrix, bias_vector, delta, Lambda, batch_size, num_iter, learning_rate,W,plotting);
[train_accuracy, valid_accuracy] = testModel(training_weights, train_Matrix, train_label_vector, valid_Matrix, valid_label_vector);
%%% IMPORTANT: The results of my numerical and analytical gradients are not
%%% same. I am doing something wrong somewhere for sure.

%% Simply print the results once 
output1 = [train_accuracy, valid_accuracy];
output2 = training_weights;
output = {output1;output2};
%% 
%showTemplateImagesOfCurrentWeightMatrix(training_weights,labelNames);

end