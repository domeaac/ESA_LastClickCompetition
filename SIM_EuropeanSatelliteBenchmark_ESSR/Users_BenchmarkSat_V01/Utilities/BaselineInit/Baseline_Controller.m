% ========================================================================
%                           BASELINE CONTROLERS 
%
% In this script you can find the baseline controller solutions proposed by
% ISAE-SUPAERO. The user can adapt the script in order to plug its own
% solution. Note that a modification of the Simscape_Benchmark_SIM1 model is
% in this case as well as explained in the dedicated tutorial 
% (User Guide - Sec. 6.3.4) 
%
%-------------------------------------------------------------------------
% Copyright (c) ISAE-SUPAERO, All Rights Reserved.
% Paolo Iannelli, Francesco Sanfedino, Daniel Alazard (2024)

% All folders and files in this forder are licenced under the 
% European Space Agency Public Licence - v2.4 - Permissive (Type 3) 
% [https://essr.esa.int/license/european-space-agency-public-license-v2-4-permissive-type-3]

% The development of this software was possible thanks to the
% ESA Contract No. 4000141060/23/NL/MGu.

% IMPORTANT: Any use of the present software (i.g. presentations, official documents, 
% scientific article or report) should be correctly referred to as follows:
% "Sanfedino, F. and Iannelli, P. and Alazard, D. and Pelletier, É. 
% and Bennani, S. and Girouart, B., European Satellite Benchmark 
% for Control Education and Industrial Training, IFAC-PapersOnLine, 
% Volume 58, Issue 16, 2024, pp. 193-198" 
%-------------------------------------------------------------------------

                                 
%% ------------------------------------------------------------------------
% -------------------------------------------------------------------------
% Load Controllers (for the various phases of the benchmark)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------        

% Laplace variable                                  
s=tf([1 0],1);

%% -------------------------------------------------------------------------
% SLEW MANEUVER CONTROLLER
%-------------------------------------------------------------------------
fprintf('---------------------------------------------------\n')
fprintf('Loading baseline slew controller and filter for reference signal for attitude \n')
fprintf('Comment this section if the user wants to provide a difference guidance and slew controller \n')
fprintf('---------------------------------------------------\n\n')

% NOTE : for the slew maneuver and also for the rest of the simulation the
% spacecraft has to rotate and stabilize around 15° around its X axis. The
% reference attitude HAS TO BE PROVIDED on each axis: in the baseline solution
% provided here we propose a unitary step signal passing through a discretized 
% filter used in the Simulation (see Simulink file: Simscape_Benchmark_SIM1/Controllers)
% 
                                             
% load ISAE-SUPAERO baseline controller parameters (to comment out and modify for user solution)
load('Slew_Controller_thrusters_2024-04-09_01h48m27s',...
    'CLoptSlew','FilterContr','Slew');

Slew.RefModel.SteadyStateValue_X=15*pi/180;
Slew.RefModel.SteadyStateValue_Y=0*pi/180;
Slew.RefModel.SteadyStateValue_Z=0*pi/180;
Slew.RefModel.SteadyStateVector=[Slew.RefModel.SteadyStateValue_X;Slew.RefModel.SteadyStateValue_Y;...
                                Slew.RefModel.SteadyStateValue_Z]; 
                            
Slew.RefModel.freq=0.0005;
Slew.RefModel.overshoot=0; 
Slew.RefModel.zeta=cos(atan2(pi,-log(Slew.RefModel.overshoot)));

% For the controller 
Slew.Ref_model.Function_X=(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(1))^2/...
(s^2+2*Slew.RefModel.zeta*(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(1))*s+...
(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(1))^2)*Slew.RefModel.SteadyStateVector(1);

Slew.Ref_model.Function_Y=(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(2))^2/...
(s^2+2*Slew.RefModel.zeta*(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(2))*s+...
(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(2))^2)*Slew.RefModel.SteadyStateVector(2);

Slew.Ref_model.Function_Z=(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(3))^2/...
(s^2+2*Slew.RefModel.zeta*(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(3))*s+...
(2*pi*Slew.RefModel.freq/Slew.RefModel.SteadyStateVector(3))^2)*Slew.RefModel.SteadyStateVector(3);

if Slew.RefModel.SteadyStateVector(1)==0
   Slew.Ref_model.Function_X=ss(0);
end
if Slew.RefModel.SteadyStateVector(2)==0
   Slew.Ref_model.Function_Y=ss(0); 
end
if Slew.RefModel.SteadyStateVector(3)==0
   Slew.Ref_model.Function_Z=ss(0); 
end

Slew.Ref_model.Function_X_disc = c2d(Slew.Ref_model.Function_X,Model.ACS_sampling.Ts,'zoh');                            
Slew.Ref_model.Function_Y_disc = c2d(Slew.Ref_model.Function_Y,Model.ACS_sampling.Ts,'zoh');
Slew.Ref_model.Function_Z_disc = c2d(Slew.Ref_model.Function_Z,Model.ACS_sampling.Ts,'zoh');

w_x_slew=getBlockValue(CLoptSlew,'w_x');w_x_slew=w_x_slew.d;
w_y_slew=getBlockValue(CLoptSlew,'w_y');w_y_slew=w_y_slew.d;
w_z_slew=getBlockValue(CLoptSlew,'w_z');w_z_slew=w_z_slew.d;
Kp_x_slew=getBlockValue(CLoptSlew,'Kp_x');Kp_x_slew=Kp_x_slew.d;
Kp_y_slew=getBlockValue(CLoptSlew,'Kp_y');Kp_y_slew=Kp_y_slew.d;
Kp_z_slew=getBlockValue(CLoptSlew,'Kp_z');Kp_z_slew=Kp_z_slew.d;
Kv_x_slew=getBlockValue(CLoptSlew,'Kv_x');Kv_x_slew=Kv_x_slew.d;
Kv_y_slew=getBlockValue(CLoptSlew,'Kv_y');Kv_y_slew=Kv_y_slew.d;
Kv_z_slew=getBlockValue(CLoptSlew,'Kv_z');Kv_z_slew=Kv_z_slew.d;

% first order low pass filter with tunable parameters 
F1x_slew=w_x_slew/(s+w_x_slew);
F1y_slew=w_y_slew/(s+w_y_slew);
F1z_slew=w_z_slew/(s+w_z_slew);

kpd_x_slew=[Kp_x_slew,Kv_x_slew];
kpd_y_slew=[Kp_y_slew,Kv_y_slew];
kpd_z_slew=[Kp_z_slew,Kv_z_slew];

% 2nd order filters
filterx_slew=getBlockValue(CLoptSlew,'filtex1');
filtery_slew=getBlockValue(CLoptSlew,'filtey1');
filterz_slew=getBlockValue(CLoptSlew,'filtez1');


Kslew_opt=ss(FilterContr*[filterx_slew*F1x_slew*kpd_x_slew(1),0 0 filterx_slew*F1x_slew*kpd_x_slew(2) 0 0;...
    0 filtery_slew*F1y_slew*kpd_y_slew(1) 0 0 filtery_slew*F1y_slew*kpd_y_slew(2) 0;...
    0 0 filterz_slew*F1z_slew*kpd_z_slew(1) 0 0 filterz_slew*F1z_slew*kpd_z_slew(2)]);


Kslew_opt_disc_zoh = c2d(Kslew_opt,Model.ACS_sampling.Ts,'zoh');
Kslew_opt_disc_t = c2d(Kslew_opt,Model.ACS_sampling.Ts,'tustin');
 

%% ------------------------------------------------------------------------
% Coarse pointing controllers
%-------------------------------------------------------------------------
fprintf('---------------------------------------------------\n')
fprintf('Loading baseline coarse controller \n')
fprintf('Comment this section if the user wants to provide a different coarse controller \n')
fprintf('---------------------------------------------------\n\n')

load('Benchmark_CoarsePointing_2024-04-09_01h01m08s','CLoptCoarse',...
    'FilterContr','InfoCoarse')
w_x=getBlockValue(CLoptCoarse,'w_x');w_x=w_x.d;
w_y=getBlockValue(CLoptCoarse,'w_y');w_y=w_y.d;
w_z=getBlockValue(CLoptCoarse,'w_z');w_z=w_z.d;
Kp_x=getBlockValue(CLoptCoarse,'Kp_x');Kp_x=Kp_x.d;
Kp_y=getBlockValue(CLoptCoarse,'Kp_y');Kp_y=Kp_y.d;
Kp_z=getBlockValue(CLoptCoarse,'Kp_z');Kp_z=Kp_z.d;
Kv_x=getBlockValue(CLoptCoarse,'Kv_x');Kv_x=Kv_x.d;
Kv_y=getBlockValue(CLoptCoarse,'Kv_y');Kv_y=Kv_y.d;
Kv_z=getBlockValue(CLoptCoarse,'Kv_z');Kv_z=Kv_z.d;

filterx_opt=getBlockValue(CLoptCoarse,'filtex1');
filtery_opt=getBlockValue(CLoptCoarse,'filtey1');%(s^2/omega_num_y1+2*zeta_num_y1*s+1)/(s^2/omega_den_y1+2*zeta_den_y1*s+1);
filterz_opt=getBlockValue(CLoptCoarse,'filtez1');%(s^2/omega_num_z1+2*zeta_num_z1*s+1)/(s^2/omega_den_z1^2+2*zeta_den_z1*s+1);

kpd_x_final=[Kp_x,Kv_x];
kpd_y_final=[Kp_y,Kv_y];
kpd_z_final=[Kp_z,Kv_z];

%% First order low pass filter with tunable parameters 
F1x_final=w_x/(s+w_x);
F1y_final=w_y/(s+w_y);
F1z_final=w_z/(s+w_z);

K_finalNofilter=ss(-FilterContr*[F1x_final*kpd_x_final,0 0 0 0;...
0 0 F1y_final*kpd_y_final 0 0;...
0 0 0 0 F1z_final*kpd_z_final]);

K_Coarse=ss(-FilterContr*[filterx_opt*F1x_final*kpd_x_final,0 0 0 0;...
 0 0 filtery_opt*F1y_final*kpd_y_final 0 0;...
 0 0 0 0 filterz_opt*F1z_final*kpd_z_final]);

K_Coarse_disc_zoh= c2d(K_Coarse,Model.ACS_sampling.Ts,'zoh');
K_Coarse_disc_t = c2d(K_Coarse,Model.ACS_sampling.Ts,'tustin');
 

%% ------------------------------------------------------------------------
% Fine controllers
%-------------------------------------------------------------------------

fprintf('---------------------------------------------------\n')
fprintf('Loading baseline fine controller \n')
fprintf('Comment this section if the user wants to provide a different fine controller \n')
fprintf('---------------------------------------------------\n\n')

load('Benchmark_FinePointing_2024-04-09_23h55m44s','K_FSM')

K_FSM_disc_zoh= c2d(K_FSM,Model.PayloadMeas_sampling.Ts,'zoh');
K_FSM_disc_t = c2d(K_FSM,Model.PayloadMeas_sampling.Ts,'tustin');

%% ------------------------------------------------------------------------
% SIMPLE FRICTION COMPENSATION SCHEME
%--------------------------------------------------------------------------
fprintf('---------------------------------------------------\n')
fprintf('Loading baseline friction compensation scheme \n')
fprintf('Comment this section if the user wants to test another algorithm \n')
fprintf('---------------------------------------------------\n\n')

RWS.FrictionEstimation.Kf=0.001; 
RWS.FrictionEstimation.Filter=ss(tf(RWS.FrictionEstimation.Kf*20,[1 RWS.FrictionEstimation.Kf])*eye(4));
RWS.FrictionEstimation.FilterD=c2d(RWS.FrictionEstimation.Filter,Model.ACS_sampling.Ts);
RWS.FrictionEstimation.T_excludeTransient=10; % [sec]

RWS.FrictionEstimation.PreFilterRW=ss(tf(1*2*pi,[1 1*2*pi])*eye(4));
RWS.FrictionEstimation.PreFilterRW=c2d(RWS.FrictionEstimation.PreFilterRW,Model.ACS_sampling.Ts);


%% ------------------------------------------------------------------------
% Coarse 2 fine FSM activation (Baseline controller)
%--------------------------------------------------------------------------
W_lowPass_activation=tf(1,[2 1]);
W_lowPass_activation_d=c2d(W_lowPass_activation,Model.PayloadMeas_sampling.Ts);
