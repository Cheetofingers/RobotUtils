function out = massinertia(J, M)
%Return the robotics general form mass inertia matrix for a manipulator
%J: 6xn body jacobians for the manipuatlor joints
%M: Generalized inertia matrix for joint i.
    massiner = zeros(size(J,2));
    for i = 1:size(J,3)
        massiner = massiner +transpose(J(:,:,i))*M(:,:,i)*J(:,:,i);
    end
    out = simplify(massiner);
end
