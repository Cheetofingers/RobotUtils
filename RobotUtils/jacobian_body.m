 function out = jacobian_body(g, twists, angles)
    % Return the body jacobians of the input manipulator parameters.
    % g: SE4 matrices of joint positions
    % twists: 6x1 vectors of joint twists
    % angles: 1xn vector of symbolic angle variables
    g_length = size(g,3);
    Jb = sym(zeros(6,g_length));
    for i = 1:g_length
        jb = sym(zeros(6,g_length));
        g_o = g(:,:,i);
        expmap =eye(4);
        %get the exponential map
        for j = i:-1:1
            if(j==i)
                jb(:,i) = adjinv(g_o)*twists(:,i);
            else
                for k=j+1:i
                    expmap = expmap*expmapSE3(twists(:,:,k),angles(:,k));
                end
                jb(:,j)= adjinv(expmap*g_o)*twists(:,:,j);
                expmap = eye(4);
            end
        end
        Jb(:,:,i) = jb;
    end
    out = simplify(Jb);
end

