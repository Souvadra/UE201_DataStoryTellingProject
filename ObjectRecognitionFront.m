function output = ObjectRecognitionFront(train_frequency, test_frequency)
%{
This is going to be the frontend of the code which will call all the
necessary functions and perform the final operation of object recognition.
%}
%% Loading the data and dividing into making the training, testing and validation set
[dataArray_matrix, labels_vector, labelNames] = miniloadData(); % this also normalised the value of the data matrix
[test_Matrix, train_Matrix, valid_Matrix, test_label_vector, train_label_vector, valid_label_vector] = test_train_validation_set_maker(dataArray_matrix, labels_vector, train_frequency, test_frequency);
clearvars dataArray_matrix labels_vector train_frequency test_frequency;

%% Initial weight vector and bias vector and hyperparameters
W = rand(size(labelNames,1), size(train_Matrix(1,:),2));
b = zeros(size(labelNames,1),1); % just making it zero for now, will change later for better performance
Lambda = 0.1; % just making this randomly
delta = 1.0;
%% defining the loss-function
%% Gradient stuff
initital_loss = SVM(train_label_vector, train_Matrix, W, b, delta, Lambda)
step_size = 0.00001; % random value, this is a hyperparameter...
% Vanilla Minibatch Gradient Descent 
for i=1:20
    i
    [batch_label_vector, batch_data_Matrix] = sample_training_batch(train_label_vector, train_Matrix, 16); %Sample 32 examples
    W_gradient = evaluateSVMNumericalGradient(batch_label_vector, batch_data_Matrix, W, b, delta, Lambda);
    W = W - step_size * W_gradient; 
end
final_loss = SVM(train_label_vector, train_Matrix, W, b, delta, Lambda)
showTemplateImagesOfCurrentWeightMatrix(W,labelNames);

end