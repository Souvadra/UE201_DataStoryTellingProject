function L = SVM(actual_class, input_data_matrix, weight_matrix, bias_vector, delta, Lambda)
%{
This is my SVM classifier to that takes the following parameters and
hyper-parameters and returns the scalar Loss function.
%}  
    %% Hope this works !!!
    l = zeros(size(input_data_matrix,1),1);
    for i=1:size(input_data_matrix,1)
        f = (weight_matrix * input_data_matrix(i,:)') + bias_vector;
        actual_answer = f(actual_class);
        f(actual_class) = [];
        l(i) = sum(max(0,f+ (-actual_answer+delta)));
    end
    L = mean(l) + (Lambda * sumSquareOfMatrix(weight_matrix));
end