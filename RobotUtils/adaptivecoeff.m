function out = adaptivecoeff(M,C,N)
% Return the adaptive law. 
% M: mass inertia matrix from robotics standard form equation
% C: coriolis/centripedal matrix from robotics standard form equation
% N: gravity matrix from robotics standard form equation
    out = uniquecoeff(horzcat(coeff(M), coeff(C), coeff(N)));
end