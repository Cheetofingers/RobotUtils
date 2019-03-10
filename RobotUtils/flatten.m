function out = flatten(A)
    B = sym(0);
    for i =1:length(A)
        B = B + A(i);
    end
    out = B;
end