function dW = evaluateSVMNumericalGradient(actual_class, input_data_matrix, weight_matrix, bias_vector, delta, Lambda)
%{
This function implements the numericala gradient of a function f at a
vector input point x. 
This function will probably be very slow and is gonna take a lot of time. 
%}
    dW = zeros(size(weight_matrix));
    h = 0.000001;
    for row=1:size(weight_matrix,1)
        for col=1:size(weight_matrix,2)
            this_weight_matrix = weight_matrix;
            this_weight_matrix(row,col) = this_weight_matrix(row,col) + h;
            now_loss = SVM(actual_class, input_data_matrix, this_weight_matrix, bias_vector, delta, Lambda);
            dW(row,col) = now_loss;
        end
    end
end
