function out = coriolis(M, angles, angles_dot)
% Return the coriolis/centripedal matrix, which is of the form
% C*theta_dotj. (not the C matrix which already has theta_dotj
% premultiplied)
% M: nxn mass intertia matrix of manipulator
% angles: 1xn vector of symbolic angle variables
% angles_dot: 1xn vector of symbolic velocity variables
    Christoffel = christoffel(M,angles);
    len = length(angles);
    C = sym(zeros(len));
    %rearrange the christoffel symbols into a nx1 corialis/centrip vector 
    for i = 1:len
        for j = 1: len
            for k = 1:len
                C(i,j) = C(i,j)+Christoffel(i,j,k)*angles_dot(k);
            end
        end
    end
    out = simplify(C);
end       