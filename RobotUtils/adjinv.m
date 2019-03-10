  function out = adjinv(g)
  % Return the adjoint inverse transformation of vector mapping g.
  % g: 4x4 position/rotation matrix of a joint.
            R = g(1:3,1:3);
            Rt = transpose(R);
            p = [g(1,4);g(2,4);g(3,4)];
            phat = hat(p);
            out = simplify(vertcat(horzcat(Rt,-Rt*phat),horzcat(zeros(3),Rt)));
        end

