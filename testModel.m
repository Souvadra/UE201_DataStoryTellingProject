function [training_accuracy, validation_accuracy] = testModel(trained_weights, train_Matrix, train_class, valid_Matrix, valid_class)
%%% This function inputs the validation and training data and the weights
%%% and shows how well the model performs on training_data and the 
%%% validation data. 
%% Predict on Training data
train_result_matrix = trained_weights * train_Matrix';
train_result_matrix = train_result_matrix';
predicted_class_vector = argmax(train_result_matrix,2);
training_accuracy = sum(predicted_class_vector == train_class)/size(train_class,1) * 100; % percentage
%% Predict on Validatoin data
valid_result_matrix = trained_weights * valid_Matrix';
valid_result_matrix = valid_result_matrix';
predicted_class_vector = argmax(valid_result_matrix,2);
validation_accuracy = sum(predicted_class_vector == valid_class)/size(valid_class,1) * 100; % percentage
end