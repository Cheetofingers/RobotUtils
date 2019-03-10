function out = coeff(A)
% Return all the unique coefficients in the input matrix A.
    coeff = sym(0);
    %children function does not work as intended if there is only 1
    %variable in the matrix array. to get around this add a placeholder
    %variable and later remove it from the coefficient array.
    syms placeholder theta1 theta2 theta3 theta4 theta5 theta6 ...
        theta_dot1 theta_dot2 theta_dot3 theta_dot4 theta_dot5 theta_dot6 ...
        theta_dot_dot1 theta_dot_dot2 theta_dot_dot3 theta_dot_dot4 ...
        theta_dot_dot5 theta_dot_dot6
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            coeff = horzcat(coeff, children(A(i,j)+placeholder));
        end
    end
    coeff = coeff(coeff~=0);
    coeff = coeff(coeff~=placeholder);
    coeff = unique(coeff);
    
    test = coeff;
    theta = symn('theta', 6);
    theta_dot = symn('theta_dot', 6);
    theta_dot_dot =symn('theta_dot_dot',6);
    theta_comb = horzcat( comb4(theta), comb3(theta),comb2(theta), theta, (2*theta));
     
    theta_dot_comb = horzcat( comb4(theta_dot),comb3(theta_dot), comb2(theta_dot), theta_dot);

    for k=1:length(theta_dot_comb)
        coeff = subs(coeff, theta_dot_comb(k), 1);
    end
    
    for k = 1:length(theta_comb)
        coeff = subs(coeff,cos(theta_comb(k)),1);
        coeff = subs(coeff,sin(theta_comb(k)),1);
    end
    
    for k = 1:length(theta_dot_dot)
        coeff = subs(coeff, theta_dot_dot(k),1);
    end
 
    out = coeff;
end