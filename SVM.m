function L = SVM(actual_class, input_data, weight_matrix, bias_vector, delta, Lambda)
%{
This is my SVM classifier to that takes the following parameters and
hyper-parameters and returns the scalar Loss function.
%}  
    %% Hope this works !!!
    f = (weight_matrix * input_data') + bias_vector;
    actual_answer = f(actual_class);
    f(actual_class) = [];
    L_i_vector = max(0,f+ (-actual_answer+delta));
    L = mean(L_i_vector) + (Lambda * sumSquareOfMatrix(weight_matrix));
end