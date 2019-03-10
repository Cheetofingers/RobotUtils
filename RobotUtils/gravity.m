function out = gravity(g_o,m,g,twists, angles)
 % Return the gravity vector for the input manipulator parameters.
 % g_o: SE4 matrices of joint positions
 % m: mass of link
 % g: symbolic variable for gravity
 % twists: 6x1 vectors of joint twists
 % angles: 1xn vector of symbolic angle variables
    g_length = size(g_o,3);
    V = 0;
    for i=1:g_length
        expmap = eye(4);
        gi_o = g_o(:,:,1);
        for j = 1:i
            expmap = expmap*expmapSE3(twists(:,:,j),angles(:,j));
        end
        h_current = expmap*gi_o;
        V = V+ g*m(i)*h_current(3,4);
    end
    N = sym(zeros(g_length,1));
    for k=1:g_length
        N(k) = diff(V,angles(k));
    end
    out = simplify(N);
end