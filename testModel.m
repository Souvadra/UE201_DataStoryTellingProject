function [training_accuracy, testing_accuracy] = testModel(trained_weights, train_Matrix, train_class, test_Matrix, test_class)
%%% This function inputs the testing and training data and the weights
%%% found from training the training data, and shows how well the model
%%% performs on training_data and testing_data. 

%% Predict on Training data
train_result_matrix = trained_weights * train_Matrix';
train_result_matrix = train_result_matrix';
predicted_class_vector = argmax(train_result_matrix,2);
training_accuracy = sum(predicted_class_vector == train_class)/size(train_class,1) * 100; % percentage
%% Predict on Testing data
test_result_matrix = trained_weights * test_Matrix';
test_result_matrix = test_result_matrix';
predicted_class_vector = argmax(test_result_matrix,2);
testing_accuracy = sum(predicted_class_vector == test_class)/size(test_class,1) * 100; % percentage
end