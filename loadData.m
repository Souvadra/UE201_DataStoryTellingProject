function [dataArray_matrix, labels_vector, labelNames] = loadData()
%{
This function should be in the same directory where the CIFAR data files
are. This function basically loads all the data and make a combined array
for the image-data, their labels, and the names of the labels. This also
normalises the whole data matrix.
%}
dataArray_matrix = [];
labels_vector = [];
labelNames = [];

load('batches.meta.mat')
labelNames = [labelNames; label_names];

load('data_batch_1.mat')
dataArray_matrix = [dataArray_matrix; data];
labels_vector = [labels_vector; labels];

load('data_batch_2.mat')
dataArray_matrix = [dataArray_matrix; data];
labels_vector = [labels_vector; labels];

load('data_batch_3.mat')
dataArray_matrix = [dataArray_matrix; data];
labels_vector = [labels_vector; labels];

load('data_batch_4.mat')
dataArray_matrix = [dataArray_matrix; data];
labels_vector = [labels_vector; labels];

load('data_batch_5.mat')
dataArray_matrix = [dataArray_matrix; data];
labels_vector = [labels_vector; labels];

% making the label vector starting from 1 instead of 0
labels_vector = labels_vector + 1;

% normalising the data_matrix
%dataArray_matrix = double(dataArray_matrix)./255;
end
