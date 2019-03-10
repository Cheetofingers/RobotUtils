function [Ki, Kd, Kp] = classicalpid(M,C)
% Return proportional, derivative and integral gains for manipulator
% dynamics. The gains are a function of the dynamics parameters and the
% system poles (poles are denoated by p).
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
Ki = sym(zeros(1,n));
p = sym('p');
    for i = 1:n
        Kp(i) = 3*(p^2)*M_diag(i);
        Kd(i) = (3*p*M_diag(i)) - C_diag(i);
        Ki(i) = (M_diag(i)*(p^3));
    end
    Kp = simplify(collect(Kp, p));
    Kd = simplify(collect(Kd,p));
    Ki = simplify(collect(Ki,p));
end