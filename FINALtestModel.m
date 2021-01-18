function testing_accuracy = FINALtestModel(weights, test_Matrix, test_class)
%%% This function checks for the accuracy of the model created after
%%% Gradient Descent. This tests the data on the test_set and not on the
%%% validation set of the data. The accuracy given by this function is
%%% considered the ultimate accuracy of my model. Well, let's hope so...
%% Predict on testing data
test_result_matrix = weights * test_Matrix';
test_result_matrix = test_result_matrix';
predicted_class_vector = argmax(test_result_matrix,2);
testing_accuracy = sum(predicted_class_vector == test_class)/size(test_class,1) * 100; % percentage
