function out = g_o(pos)
%Return the 4x4 matrix denoting a joint position and rotation.
%pos: vector of a joints x,y,z location.
            out = vertcat(horzcat(eye(3),pos),[0,0,0,1]); 
end

