function testing_accuracy = FINALtestModel(weights, test_Matrix, test_class)
 

%% Predict on testing data
test_result_matrix = weights * test_Matrix';
test_result_matrix = test_result_matrix';
predicted_class_vector = argmax(test_result_matrix,2);
testing_accuracy = sum(predicted_class_vector == test_class)/size(test_class,1) * 100; % percentage
