function out = classical(M, n)
% Return matrix M will all its non-linear terms omitted.
% M = input matrix (generally mass inertia matrix)
% n = DoF of system
    thetas = symn('theta',n);
    zeroarray = zeros(1,length(thetas));
    out = simplify(subs(M,thetas,zeroarray));
end