function out = twist(axis,q)
%Return the twist of joint.
%axis:unit vector of a joints axis of rotation
%q: position of a joints axis of rotation
            zeta1 = cross(-axis,q);
            zeta2 = axis;
            out = [zeta1; zeta2];
end

