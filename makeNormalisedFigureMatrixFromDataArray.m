function AnswerMatrix = makeNormalisedFigureMatrixFromDataArray(data_array)
%{
 This function takes in a CIFAR type data-array and make a RGB tensor out
 of it. The tensor is then normalized before output, so that the MATLAB
 'image' function can be applied on it directly for check the image.
%}
red_array = data_array(1:1024);
green_array = data_array(1025:2048);
blue_array = data_array(2049:3072);

red_matrix = zeros(32,32);
for row=(1:32)
    red_matrix(row,:) = red_array(((row-1)*32)+1:((row-1)*32)+32);
end

green_matrix = zeros(32,32);
for row=(1:32)
    green_matrix(row,:) = green_array(((row-1)*32)+1:((row-1)*32)+32);
end

blue_matrix = zeros(32,32);
for row=(1:32)
    blue_matrix(row,:) = blue_array(((row-1)*32)+1:((row-1)*32)+32);
end

AnswerMatrix = zeros(32,32,3);
AnswerMatrix(:,:,1) = red_matrix;
AnswerMatrix(:,:,2) = green_matrix;
AnswerMatrix(:,:,3) = blue_matrix;

AnswerMatrix = AnswerMatrix./255;
end 