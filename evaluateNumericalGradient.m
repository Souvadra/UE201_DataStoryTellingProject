function output = evaluateNumericalGradient(f, W)
%{
This function implements the numericala gradient of a function f at a
vector input point x. 
%}
%% NOT COMPLETE
r1 = f(W);
h = 0.0001; step_size;
for t=(1:10)
    Gradient = df(W);
    W = W - h*Gradient;
end
output = W;
end
