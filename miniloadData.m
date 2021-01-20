function [dataArray_matrix, labels_vector, labelNames] = miniloadData()
%%% This is a little brother of the loadData.m function and works on only a
%%% single batch of the data, rather than the whole dataset. This is useful
%%% to work with while doing some experiment, as this significantly reduce
%%% the RAM usage, which I found myself bottleneching many times while
%%% building my model.
dataArray_matrix = [];
labels_vector = [];
labelNames = [];

load('batches.meta.mat')
labelNames = [labelNames; label_names];

load('data_batch_1.mat')
dataArray_matrix = [dataArray_matrix; data];
labels_vector = [labels_vector; labels];

% making the label vector starting from 1 instead of 0
labels_vector = labels_vector + 1;

% normalising the data_matrix
% dataArray_matrix = double(dataArray_matrix)./255;
end