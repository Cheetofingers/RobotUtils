function out = collecttrig(A)
%Return A using matlabs collect function to group all terms by sin/cos
%coefficients.
    out = collect(A, {'sin', 'cos'});
end       