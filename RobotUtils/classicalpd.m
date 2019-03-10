function [Kd, Kp] = classicalpd(M,C)
% Return proportional and derivative gains for input manipulator dynamics.
% The gains are a function of the dynamics parameters and the system poles
% (poles are denoated by p)
% M: mass inertia matrix which has been simplified for use in a classical
% controller (non-linear terms are ignored)
% C: corialis/centripetal matrix which has also been simplified for use in
% a classical controller (only remaining terms are viscous damping and back
% emf)
M_diag = diag(M);
C_diag = diag(C);
n = length(M_diag);
Kp = sym(zeros(1,n));
Kd = sym(zeros(1,n));
p = sym('p');
%from characterstic eq 1+CP = 0 gains are derived
    for i = 1:n
        Kp(i) = (p^2)*M_diag(i);
        Kd(i) = (2*p*M_diag(i)) - C_diag(i);
    end
    Kp = simplify(collect(Kp, p));
    Kd = simplify(collect(Kd,p));
end

