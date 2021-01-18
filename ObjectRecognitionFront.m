function output = ObjectRecognitionFront(train_Matrix, valid_Matrix, train_label_vector, valid_label_vector, labelNames, learning_rate, batch_size, num_iter, Lambda, plotting)
%%% This function is callled by the main function everytime to train the
%%% model with the given data and hyperparameters.
%% Initial weight vector and bias vector and hyperparameters
W = rand(size(labelNames,1), size(train_Matrix(1,:),2)) * 0.0001;
bias_vector = zeros(size(labelNames,1),1); % just making it zero for now, will change later for better performance
delta = 1.0;
training_weights = trainModelSVM(train_label_vector, train_Matrix, bias_vector, delta, Lambda, batch_size, num_iter, learning_rate,W,plotting);
[train_accuracy, valid_accuracy] = testModel(training_weights, train_Matrix, train_label_vector, valid_Matrix, valid_label_vector);
%% Simply print the results once 
output1 = [train_accuracy, valid_accuracy];
output2 = training_weights;
output = {output1;output2};
end