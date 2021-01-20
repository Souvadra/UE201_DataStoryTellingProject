function [batch_label_vector, batch_data_Matrix] = sample_training_batch(input_label_vector, input_Matrix, batchSize)
%%% This function will take the training data and make a small batch of
%%% randomized data where we are going to apply our Stochastic Gradient
%%% Descent.
random_permutation = randperm(size(input_label_vector,1));
batch_label_vector = zeros(batchSize,1);
batch_data_Matrix = zeros(batchSize,size(input_Matrix,2));
for i=(1:batchSize)
    batch_label_vector(i,1) = input_label_vector(random_permutation(i));
    batch_data_Matrix(i,:) = input_Matrix(random_permutation(i),:);
end

end