function out = horzvector(A)
% Return a horizontal vector of matrix A.
    syms s;
    B = s;
    for i=1:size(A,1)
        for j=1:size(A,2)
            if(B(1)==s)
                B(1) = A(i,j);
            else       
                B = horzcat(B,A(i,j));
            end
        end
    end
    out = B;
end