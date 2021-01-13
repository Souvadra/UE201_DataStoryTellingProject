function output_weight_matrix = trainModelSVM(train_label_vector, train_Matrix, bias_vector, delta, Lambda, batch_size, num_iter, learning_rate,W,plotting)
%%% This function takes the training data and hyperparameters as input and
%%% performs the training of the model using a SVM loss function, and
%%% returns the output_weights in the form of a matrix.

    %W = rand(10, size(train_Matrix(1,:),2)) * 0.0001; %% initialising a random weight vector to get started
    %learning_rate = 0.0001; % random value, this is a hyperparameter...
    % Vanilla Minibatch Gradient Descent 
    [batch_label_vector, batch_data_Matrix] = sample_training_batch(train_label_vector, train_Matrix, batch_size);
    [initial_loss, ignore_it] =  SVM(batch_label_vector, batch_data_Matrix, W, bias_vector, delta, Lambda);
    progress_counter_x = zeros(1,num_iter/100);
    progress_counter_y = zeros(1,num_iter/100); % this stores the loss generated per iteration
    % Working with the analytical gradient here in this example
    for i=2:num_iter+1
        [batch_label_vector, batch_data_Matrix] = sample_training_batch(train_label_vector, train_Matrix, batch_size);
        [loss, W_gradient] = SVM(batch_label_vector, batch_data_Matrix, W, bias_vector, delta, Lambda);
        W = W - learning_rate * W_gradient;
        if rem(i,100) == 0
            progress_counter_x(i/100) = i;
            progress_counter_y(i/100) = loss;
        end
    end
    %%% IMPORTANT: The results of my numerical and analytical gradients are not
    %%% same. I am doing something wrong somewhere for sure.
    progress_counter_y = [initial_loss, progress_counter_y];
    progress_counter_x = [0, progress_counter_x];
    if plotting==true
        figure()
        scatter(progress_counter_x, progress_counter_y,'*','red'); hold on;
        ppp = plot(progress_counter_x, progress_counter_y,'--');
        ppp.Color = 'k';
        % commenting out this above line temporarily
        title("Training progress");
        xlabel("Number of Iteration");
        ylabel("Loss function value");
        hold off
    end

    output_weight_matrix = W;
end