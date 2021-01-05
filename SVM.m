function [L, dW]= SVM(class_label_vector, input_data_matrix, weight_matrix, bias_vector, delta, Lambda)
%{
This is my SVM classifier to that takes the following parameters and
hyper-parameters and returns the scalar Loss function. It also calculates
te analytical gradient of the SVM loss function and returns the gradient
value. 
%}  
    %% Computing the loss function 
    l = zeros(size(input_data_matrix,1),1);
    l_matrix = zeros(size(input_data_matrix,1),10);
    for i=1:size(input_data_matrix,1)
        f = (weight_matrix * input_data_matrix(i,:)') + bias_vector;
        actual_answer = f(class_label_vector(i));
        %f(class_label_vector(i)) = [];
        margin = max(0,f + (-actual_answer+delta));
        l_matrix(i,:) = margin';
        margin(class_label_vector(i)) = [];
        l(i) = sum(margin);
    end
    L = mean(l) + (Lambda * sumSquareOfMatrix(weight_matrix));
    
    %% Computing the analytical gradient 
    l_matrix = double(l_matrix > 0);
    L_vector = -1 * sum(l_matrix,2);
    for j=1:size(class_label_vector,1)
        l_matrix(j, class_label_vector(j)) = l_matrix(j, class_label_vector(j)) + L_vector(j);
    end
    dW = l_matrix' * input_data_matrix;
    dW = dW ./ double(size(input_data_matrix,1)); % dividing by N as per the formula
    dW = dW + weight_matrix .* (Lambda * 2); % Adding the gradient-ed regularization term
end