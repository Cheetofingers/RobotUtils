%% Manipulator Dynamics
% This script utilizes the manipulator function to derive the closed-form
% analytical solution of a robot manipulator (of n DOF). The inputs of the
% manipulator, are the joint center of masses, joint axis positions, and
% joint axis of rotations. The axis of rotations are denoted as a unit
% vector.
clear;
clc;
symn('r',2);
symn('l',2);
syms('r0', 'l0');
pos = cat(3, [0;0;l0],[0;0;l0],[0;l1;l0]);
com = cat(3, [0;0;r0],[0;r1;l0],[0;(l1+r2);l0]);
axis = cat(3,[0;0;1],[-1;0;0],[-1;0;0]);
n = size(pos,3);
%manipulator function takes in 3d position and axis arrays which are
%relative to a base frame S
[M_prime, C_prime, N_prime] = manipulator(com,pos,axis);
M_classical = classical(M_prime,3);
C_classical = classical(C_prime,3);
%[PD_Kd, PD_Kp] = classicalpd(M_classical,C_classical);
%[PID_Ki,PID_Kd,PID_Kp] = classicalpid(M_classical,C_classical);
%When all system parameters are known, substitute in values
% M_prime = subs(M_prime, {Kt1, Kt2, Kt3}, [1 1 1]);
% C_prime = subs(C_prime, {Kt1, Kt2, Kt3}, [1 1 1]);
% N_prime = subs(N_prime, {Kt1, Kt2, Kt3}, [1 1 1]);
% 
% M_coeff = coeff(M_prime);
% C_coeff = coeff(C_prime);
% N_coeff = coeff(N_prime);

Y = regressorterms(M_prime, C_prime, N_prime);


%ie: M_classical = subs(M_classical, {m1, Ix1, Iy1, Iz1}, [1, 1, 1, 1]);