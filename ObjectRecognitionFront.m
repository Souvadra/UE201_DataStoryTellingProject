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
%% defining the loss-function
loss = softMaxClassifier(train_Matrix(1,:),W,b,Lambda);
%{
Goal is the find the minima of loss function, and the weight_matrix, for
which I get the minimum loss, my matrix to go by.

Algorithm,
While the directin has magnitude != 0:
    Find the direction of steepest descent at the x (-> weight vector)
    travel to the direction with the learning rate ALPHA 
output the weigh_vector input at which we get the minimum loss function
%}


end