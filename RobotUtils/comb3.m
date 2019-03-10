function out = comb3(A)
% Return a matrix of all combinations of input matrices.
   % C = zeros(length(A),length(B));
    for i = 1:length(A)
        for j=1:length(A)
            for k=1:length(A)
                C(i,j,k)= A(i)+A(j)+A(k);
            end
        end
    end
    C = reshape(C,1,[]);
    out = unique(C);
end