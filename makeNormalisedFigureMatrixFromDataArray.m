function AnswerMatrix = makeNormalisedFigureMatrixFromDataArray(data_array)
%{
 This function takes in a CIFAR type data-array and make a RGB tensor out
 of it. The tensor is then normalized before output, so that the MATLAB
 'image' function can be applied on it directly for check the image.
%}
%%
channel_length = max(size(data_array)) / 3;
image_dim = sqrt(channel_length);

red_array = data_array(1:channel_length);
green_array = data_array(channel_length+1:2*channel_length);
blue_array = data_array(2*channel_length + 1:3 * channel_length);

red_matrix = zeros(image_dim,image_dim);
for row=(1:image_dim)
    red_matrix(row,:) = red_array(((row-1)*image_dim)+1:((row-1)*image_dim)+image_dim);
end

green_matrix = zeros(image_dim,image_dim);
for row=(1:image_dim)
    green_matrix(row,:) = green_array(((row-1)*image_dim)+1:((row-1)*image_dim)+image_dim);
end

blue_matrix = zeros(image_dim,image_dim);
for row=(1:image_dim)
    blue_matrix(row,:) = blue_array(((row-1)*image_dim)+1:((row-1)*image_dim)+image_dim);
end

AnswerMatrix = zeros(image_dim,image_dim,3);
AnswerMatrix(:,:,1) = red_matrix;
AnswerMatrix(:,:,2) = green_matrix;
AnswerMatrix(:,:,3) = blue_matrix;

AnswerMatrix = AnswerMatrix./max(max(AnswerMatrix)); %% makes sure things are normlized enough for the image function to work properly
end 