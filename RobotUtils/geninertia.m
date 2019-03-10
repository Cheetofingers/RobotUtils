function out = geninertia(mass, Ix, Iy, Iz)
%Return a generalized 6x6 diagonal matrix containing masses and inertias of
%a joint.
%mass: the mass of link of input joint.
%Ix: inertia of link about x axis about its CoM
%Iy: inertia of link about y axis about its CoM
%Iz: inertia of link about z axis about its CoM
             out1 = horzcat(eye(3)*mass, zeros(3));
             out2 = horzcat(zeros(3), diag([Ix,Iy,Iz]));
             out = vertcat(out1, out2);
 end

