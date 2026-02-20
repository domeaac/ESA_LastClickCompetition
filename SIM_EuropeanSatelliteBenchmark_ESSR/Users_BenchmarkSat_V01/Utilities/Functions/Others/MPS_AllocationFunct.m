% function y = MPS_AllocationFunct(u)
%-------------------------------------------------------------------------
% function y = MPS_AllocationFunct(u)
% This function allocates the thrust value to each thruster of a MPS given
% a specific MPS architecture and demanded force/torque vector to realize.
% INPUTS:
%   Cmd_force: (1x3) vector of desired command force  
%   Cmd_Torque: (1x3) vector desired command torque  
%   thr.nb_thr: (scalar) total number of thrusters 
%   thr.F: (scalar) thruster force [N]
%   thr.sc_thrust_Hf:(thr.nb_thr x 3) matrix mapping thruster forces to 
%                    applied forces on the spacecraft
%   thr.sc_thrust_Ht:(thr.nb_thr x 3) matrix mapping thruster forces to 
%                    applied torques on the spacecraft
% OUTPUTS:
%   U_cont: (thr.nb_thr*1) thrust force demanded to each thruster
%   Thr_activated: (scalar) number of activated thrusters
% 
% Copyright (c) ISAE-SUPAERO, All Rights Reserved.
% Paolo Iannelli, Francesco Sanfedino, Daniel Alazard (2024)
%-------------------------------------------------------------------------
