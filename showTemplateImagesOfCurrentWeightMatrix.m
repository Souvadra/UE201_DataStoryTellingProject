function showTemplateImagesOfCurrentWeightMatrix(W,labelNames)
%%% This function takes the weight_matrix as an input and outputs the sameple
%%% pictures, which will give minimium loss for these weights.
for i=1:size(W,1)
    figure()
    image(makeNormalisedFigureMatrixFromDataArray(W(i,:)))
    axis off;
    title(string(labelNames(i)));
end
end
