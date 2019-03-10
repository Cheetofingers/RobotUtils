function out = strvec(symbol, n)
    vec = zeros(1,n)
    
    len = length(angles);
    C = sym(zeros(len,len,len));
    for i = 1:len
        for j = 1:len
           for k = 1:len
                C(i,j,k) = 0.5*(diff(M(i,j),angles(k)) + ...
                    diff(M(i,k),angles(j))-diff(M(k,j),angles(i)));
           end
        end  
    end
    out = simplify(C);
end     