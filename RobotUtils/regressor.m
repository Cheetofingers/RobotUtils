function out = regressor(M,C,N)
% Return the regressor matrix. 
% M: mass inertia matrix from robotics standard form equation
% C: coriolis/centripedal matrix from robotics standard form equation
% N: gravity matrix from robotics standard form equation
    n = size(M,1);
    %phi = uniquecoeff(horzcat(coeff(M), coeff(C), coeff(N)));
    phi = horzcat(coeff(M), coeff(C), coeff(N));
%     count = length(phi);
%     Const = symn('Const', count);
    theta_dot_dot = symn('theta_dot_dot',n).';
    theta_dot = symn('theta_dot',n).';
    M_prime = (M*theta_dot_dot).';
    C_prime = (C*theta_dot).';
    N_prime = N.';
    
    
    
    AllTerms = collect(horzcat(M_prime, C_prime, N_prime),{'sin', 'cos','theta_dot_dot_1'});

    out = AllTerms;
    %out = collect(AllTerms, Const);
end