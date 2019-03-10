function out = christoffel(M, angles)
    % Return the christoffel symbols corresponding to the
    % corialis/centripetal forces of a manipulator.
    % M: nxn mass intertia matrix of manipulator
    % angles: 1xn vector of symbolic angle variables
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