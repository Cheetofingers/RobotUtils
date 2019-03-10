function out = comb4(A)
% Return a matrix of all combinations of input matrices.
   % C = zeros(length(A),length(B));
    for i = 1:length(A)
        for j=1:length(A)
            for k=1:length(A)
                for l=1:length(A)
                      C(i,j,k,l)= A(i)+A(j)+A(k)+A(l);
                end
            end
        end
    end
    C = reshape(C,1,[]);
    out = unique(C);
end