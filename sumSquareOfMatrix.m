function sumSquare = sumSquareOfMatrix(M)
%{
 This function takes a matrix and returns the sum of square of all the
 elements in that matrix.
%}
    M = M.^2;
    firstSum = sum(M);
    sumSquare = sum(firstSum);
end
