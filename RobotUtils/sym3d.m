function out = sym3d(functionhandle, vector1, vector2)
    %Return a 3d array using the input function
    %functionhandle: the function handle for function being applied to the
    %vectors
    %vector1: input 3d vector
    %vector2: optional 2nd input 3d vector. (use this if function handle
    %requires 2 input arguments)
    if exist('vector2', 'var')
        FirstArray = functionhandle(vector1(:,:,1), vector2(:,:,1));    
        Out = sym(zeros(size(FirstArray,1),size(FirstArray,2),size(vector1,3)));
        for i = 1:size(vector1,3)
            Out(:,:,i) = functionhandle(vector1(:,:,i), vector2(:,:,i));
        end
        out = Out;
    else
        FirstArray = functionhandle(vector1(:,:,1));    
        Out = sym(zeros(size(FirstArray,1),size(FirstArray,2),size(vector1,3)));
        for i = 1:size(vector1,3)
            Out(:,:,i) = functionhandle(vector1(:,:,i));
        end
        out = Out;
    end

end

