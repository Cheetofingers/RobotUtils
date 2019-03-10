function [M_prime, C_prime, N_prime] = manipulator(com, pos, axis)
%Return the mass robotics standard form matrices in the form of
%M'(theta_dot_dot) + C'(theta_dot)+N' = Voltage
%com: center of masses of each linkage of manipultor (3d array where n in ixjxn is
%number of joints)
%pos: position of the axis of rotation of each manipulator joint (3d array where n in ixjxn is
%number of joints)
%axis: axis of rotation of each manipulator joint in form of unit vectors (3d array where n in ixjxn is
%number of joints)
    n = size(pos,3);
    angles = symn('theta', n);
    angles_dot = symn('theta_dot',n);
    l = symn('l',n);
    r = symn('r',n);
    Ix = symn('Ix',n);
    Iy = symn('Iy',n);
    Iz = symn('Iz',n);
    m = symn('m',n);
    syms('g');
    
    R = diag(symn('R',n));
    Kt = diag(symn('Kt',n));
    Kv = diag(symn('Kv',n));
    c = diag(symn('c',n));
    
    G = sym3d(@g_o, com);
    twists = sym3d(@twist, axis, pos);
    Mu = geninertia(m(1),Ix(1),Iy(1),Iz(1));
    for ctr = 1: length(m)
        Mu(:,:,ctr) = geninertia(m(ctr),Ix(ctr),Iy(ctr),Iz(ctr));
    end
    
    JB = jacobian_body(G,twists,angles);
    M = massinertia(JB,Mu);
    C = coriolis(M,angles, angles_dot);
    C = C+c;
    N = gravity(G,m,g,twists,angles);

    M_prime = collecttrig(inv(Kt)*R*M);
    C_prime = collecttrig( (inv(Kt)*R*C) + Kv);
    N_prime = collecttrig(inv(Kt)*R*N);
end     