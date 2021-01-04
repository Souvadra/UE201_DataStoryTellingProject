function [test_Matrix, train_Matrix, valid_Matrix, test_label_vector, train_label_vector, valid_label_vector] = test_train_validation_set_maker(dataArray_matrix, labels_vector, train_frequency, test_frequency)
%{
This code is will generated the testing, training and validation set from
the data from the total input data.
%}
    num_data = size(dataArray_matrix,1);
    data_width = size(dataArray_matrix,2);
    num_train = uint32(train_frequency * num_data);
    num_test = uint32(test_frequency * num_data);
    num_valid = uint32(num_data - (num_train + num_test));

    random_permutation = randperm(num_data);

    train_Matrix = zeros(num_train, data_width); train_label_vector = zeros(num_train,1);
    test_Matrix = zeros(num_test,data_width); test_label_vector = zeros(num_test,1);
    valid_Matrix = zeros(num_valid,data_width); valid_label_vector = zeros(num_valid,1);

    for i=(1:num_train)
        %i
        train_Matrix(i,:) = dataArray_matrix(random_permutation(i),:);
        train_label_vector(i) = labels_vector(random_permutation(i));
    end
    for i=(num_train+1:num_train+num_test)
        j = i-num_train;
        test_Matrix(j,:) = dataArray_matrix(random_permutation(i),:);
        test_label_vector(j) = labels_vector(random_permutation(i));
    end
    for i=(num_train+num_test+1:uint32(num_data))
        j = i-num_train+num_test;
        valid_Matrix(j,:) = dataArray_matrix(random_permutation(i),:);
        valid_label_vector(j) = labels_vector(random_permutation(i));
    end
    
    test_Matrix = test_Matrix ./ 255;
    train_Matrix = train_Matrix ./ 255;
    valid_Matrix = valid_Matrix ./ 255;
end
