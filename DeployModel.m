function DeployModel(WeightMatrix, picture_vector,correctLabel)
%%% This is for deployment of my model, Currentlty it still takes only the
%%% picture data of CIFAR-10 type to be able to function properly. 

%% Working code 
figure
tiledlayout(1,2)
% Left plot 
ax2 = nexttile;
image(ax2,makeNormalisedFigureMatrixFromDataArray(picture_vector));
title(ax2, string(correctLabel));
% Right plot 
answer = WeightMatrix*picture_vector';
X = categorical({'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'});
X = reordercats(X,{'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'}); 
ax1 = nexttile;
bar(ax1,X,answer,'k');
for i=1:length(X)
    if answer(i) == max(answer)
        textAtTitle = strcat("Prediction: ", string(X(i)));
        title(ax1,textAtTitle)
    end
end
ylabel(ax1,"Scores")

end