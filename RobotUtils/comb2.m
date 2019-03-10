function out = comb2(A)
% Return a matrix of all combinations of input matrices.
   % C = zeros(length(A),length(B));
    for i = 1:length(A)
        for j=1:length(A)
            A_sum = A(i)+A(j);
            C(i,j) = A_sum;
        end
    end
    C = reshape(C,1,[]);
    out = unique(C);
end