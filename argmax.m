function output = argmax(matrix, direction)
%%% This is a simple function to mind the argmax of a matrix across the
%%% rows or the columns depending n the 'direction' mentioned.
%%% direction = 1 / 2 and follow the matlab convention itself.
if direction == 1
    output = zeros(1,size(matrix,2));
    for i=1:size(matrix,2)
        answer = find(matrix(:,i) == max(matrix(:,i)));
        if size(answer,1) ~= 1 || size(answer,2) ~= 1
            answer = answer(1,1);
        end
        output(i) = answer;
    end
end

if direction == 2
    output = zeros(size(matrix,1),1);
    for i=1:size(matrix,1)
        answer = find(matrix(i,:) == max(matrix(i,:)));
        if size(answer,1) ~= 1 || size(answer,2) ~= 1
            answer = answer(1,1);
        end
        output(i) = answer;
    end
end


end
