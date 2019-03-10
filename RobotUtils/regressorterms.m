function out = regressorterms(M,C,N)
% Return the regressor matrix. 
% M: mass inertia matrix from robotics standard form equation
% C: coriolis/centripedal matrix from robotics standard form equation
% N: gravity matrix from robotics standard form equation
    n = size(M,1);
    %phi = uniquecoeff(horzcat(coeff(M), coeff(C), coeff(N)));
    %phi = horzcat(coeff(M), coeff(C), coeff(N));
%     count = length(phi);
%     Const = symn('Const', count);
    theta_dot_dot = symn('theta_dot_dot',n).';
    theta_dot = symn('theta_dot',n).';
    M_prime = M*theta_dot_dot;
    C_prime = C*theta_dot;
    N_prime = N;
    AllTerms = collect((M_prime+C_prime+N_prime), {'sin','cos'});
%     M_prime = flatten((M*theta_dot_dot).');
%     C_prime = flatten((C*theta_dot).');
%     N_prime = flatten(N.');
%     AllTerms = M_prime+ C_prime+ N_prime;
%     
%     AllTerms = collect(AllTerms,{'sin', 'cos'});
%     AllCoeff = coeff(AllTerms);
    out = AllTerms;
end