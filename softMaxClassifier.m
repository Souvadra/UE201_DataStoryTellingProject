function L = softMaxClassifier(actual_class,input_data ,weight_matrix, bias_vector, Lambda)
%% THIS FUNCTION DOES NOT WORK PROPERLY AS OF NOW
%{
This function works as my MATLAB softmax classifier. It takes, the
input_data_vector (in the form of a row vector), WeightMatrix, biasVector,
and the Hyperparameter Lambda and calculate the Loss function value using
the Softmax Classifier and returns the value of L (scalar).
%}
%% the input_data will come as a column matrix. VV-IMP
%% 
ideal_inside_log = zeros(size(weight_matrix,1),1);
ideal_inside_log(actual_class) = 1;
f = (weight_matrix * input_data') + bias_vector;
log_of_C = -max(f);
Exp_f = exp(f+log_of_C);
inside_log = (Exp_f ./ sum(Exp_f)) - ideal_inside_log;
L_i_vector = -log(inside_log);
L = mean(L_i_vector) + (Lambda * sumSquareOfMatrix(weight_matrix));
%% output will be 10x1 vector 

end