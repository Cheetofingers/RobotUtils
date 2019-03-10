function out = expmapSE3(twist, theta)
% Return the 4x4 exponential map
% twists: 6x1 vectors of manipulator joint twist
% theta: symbolic variabile denoting angle rotation of joint
            w = [twist(4);twist(5);twist(6)];
            v = [twist(1);twist(2);twist(3)];
            t = theta;

            rightvec = ((eye(3)-expmapSO3(w, t))*(cross(w,v)))+...
                (w*transpose(w)*v*t);
             expmap = expmapSO3(w, t);
             out = simplify([expmap(1,1), expmap(1,2), expmap(1,3), rightvec(1);...
                expmap(2,1), expmap(2,2), expmap(2,3), rightvec(2);...
                 expmap(3,1), expmap(3,2), expmap(3,3), rightvec(3);...
                 0,0,0,1]);
end
