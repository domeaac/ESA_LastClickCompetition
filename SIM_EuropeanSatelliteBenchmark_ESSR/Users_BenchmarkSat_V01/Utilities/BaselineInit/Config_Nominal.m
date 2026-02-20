% 


%-------------------------------------------------------------------------
% Copyright (c) ISAE-SUPAERO, All Rights Reserved.
% Paolo Iannelli, Francesco Sanfedino, Daniel Alazard (2024)
%-------------------------------------------------------------------------

Bus.m_B_SIM=Gu.Blocks.m_B.NominalValue;               % scalar
Bus.CoM_Variation_simscape=[Gu.Blocks.CoMx.NominalValue;Gu.Blocks.CoMy.NominalValue;Gu.Blocks.CoMz.NominalValue]; % [3x1]

Bus.J_B_B_SIM(1,1)=Gu.Blocks.J_B_Bxx.NominalValue; 
Bus.J_B_B_SIM(2,2)=Gu.Blocks.J_B_Byy.NominalValue; 
Bus.J_B_B_SIM(3,3)=Gu.Blocks.J_B_Bzz.NominalValue; 
Bus.J_B_B_SIM(2,3)=Gu.Blocks.J_B_Byz.NominalValue; 
Bus.J_B_B_SIM(1,3)=Gu.Blocks.J_B_Bxz.NominalValue; 
Bus.J_B_B_SIM(1,2)=Gu.Blocks.J_B_Bxy.NominalValue; 
Bus.J_B_B_SIM(3,2)=Bus.J_B_B_SIM(2,3);
Bus.J_B_B_SIM(3,1)=Bus.J_B_B_SIM(1,3);
Bus.J_B_B_SIM(2,1)=Bus.J_B_B_SIM(1,2);

slosh.mj_simscape{1}= Gu.Blocks.Slosh_m1.NominalValue;           % sloshing mass m1
slosh.mj_simscape{2}= Gu.Blocks.Slosh_m2.NominalValue;           % sloshing mass m2
slosh.mj_simscape{3}= Gu.Blocks.Slosh_m3.NominalValue;           % sloshing mass m3
slosh.mj_simscape{4}= Gu.Blocks.Slosh_m4.NominalValue;           % sloshing mass m4
slosh.mj_simscape{5}= Gu.Blocks.Slosh_m5.NominalValue;           % sloshing mass m5
slosh.mj_simscape{6}= Gu.Blocks.Slosh_m6.NominalValue;           % sloshing mass m6

RWIsol.K_sim{1}(1,1)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW1 stiffness
RWIsol.K_sim{1}(2,2)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW1 stiffness
RWIsol.K_sim{1}(3,3)= Gu.Blocks.RWisol_axial.NominalValue;          % Axial RW1 stiffness

RWIsol.K_sim{2}(1,1)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW2 stiffness
RWIsol.K_sim{2}(2,2)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW2 stiffness
RWIsol.K_sim{2}(3,3)= Gu.Blocks.RWisol_axial.NominalValue;          % Axial RW2 stiffness

RWIsol.K_sim{3}(1,1)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW3 stiffness
RWIsol.K_sim{3}(2,2)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW3 stiffness
RWIsol.K_sim{3}(3,3)= Gu.Blocks.RWisol_axial.NominalValue;           % Axial RW3 stiffness

RWIsol.K_sim{4}(1,1)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW4 stiffness
RWIsol.K_sim{4}(2,2)= Gu.Blocks.RWisol_radial.NominalValue;          % Radial RW4 stiffness
RWIsol.K_sim{4}(3,3)= Gu.Blocks.RWisol_axial.NominalValue;          % Axial RW4 stiffness

ISOL.m_simscape= Gu.Blocks.m_Iso_and_Payload.NominalValue; % Isolator mass (it includes variation
                                          % of the isolator mass and variation in
                                          % and account variation of mass for
                                          % payload components

ISOL.IatG_simscape(1,1)=Gu.Blocks.J_B_Bxx_isopayload.NominalValue; 
ISOL.IatG_simscape(2,2)=Gu.Blocks.J_B_Byy_isopayload.NominalValue; 
ISOL.IatG_simscape(3,3)=Gu.Blocks.J_B_Bzz_isopayload.NominalValue; 
ISOL.IatG_simscape(2,3)=Gu.Blocks.J_B_Byz_isopayload.NominalValue; 
ISOL.IatG_simscape(1,3)=Gu.Blocks.J_B_Bxz_isopayload.NominalValue; 
ISOL.IatG_simscape(1,2)=Gu.Blocks.J_B_Bxy_isopayload.NominalValue; 
ISOL.IatG_simscape(3,2)=ISOL.IatG_simscape(2,3);
ISOL.IatG_simscape(3,1)=ISOL.IatG_simscape(1,3);
ISOL.IatG_simscape(2,1)=ISOL.IatG_simscape(1,2);

% Initial condition for the RW speed
   

RWS.w1simscape=-1000*2*pi/60;% RW1 speed (as intial condition)
RWS.w2simscape=1000*2*pi/60; % RW2 speed (as intial condition)
RWS.w3simscape=-1000*2*pi/60;% RW3 speed (as intial condition)
RWS.w4simscape=1000*2*pi/60; % RW2 speed (as intial condition)


if  abs(RWS.w1simscape)>RWS.w ||  abs(RWS.w2simscape)>RWS.w || abs(RWS.w3simscape)>RWS.w || abs(RWS.w4simscape)>RWS.w
error('Initial condition for one of the reaction wheels is bigger than the max. wheel speed!')        
end

SA.Krofs(7,7)= (Gu.Blocks.w_SolarArray1_1.NominalValue)^2;
SA.Krofs(8,8)= (Gu.Blocks.w_SolarArray1_2.NominalValue)^2;
SA.Krofs(9,9)= (Gu.Blocks.w_SolarArray1_3.NominalValue)^2;
SA.Krofs(10,10)= (Gu.Blocks.w_SolarArray1_4.NominalValue)^2;
SA.Krofs(11,11)= (Gu.Blocks.w_SolarArray1_5.NominalValue)^2;
SA.Krofs(12,12)= (Gu.Blocks.w_SolarArray1_6.NominalValue)^2;

SA.Krofs2(7,7)= (Gu.Blocks.w_SolarArray2_1.NominalValue)^2;
SA.Krofs2(8,8)= (Gu.Blocks.w_SolarArray2_2.NominalValue)^2;
SA.Krofs2(9,9)= (Gu.Blocks.w_SolarArray2_3.NominalValue)^2;
SA.Krofs2(10,10)= (Gu.Blocks.w_SolarArray2_4.NominalValue)^2;
SA.Krofs2(11,11)= (Gu.Blocks.w_SolarArray2_5.NominalValue)^2;
SA.Krofs2(12,12)= (Gu.Blocks.w_SolarArray2_6.NominalValue)^2;

HGA.Krofs(7,7)= (Gu.Blocks.w_HGAboom_1.NominalValue)^2;
HGA.Krofs(8,8)= (Gu.Blocks.w_HGAboom_2.NominalValue)^2;
HGA.Krofs(9,9)= (Gu.Blocks.w_HGAboom_3.NominalValue)^2;
HGA.Krofs(10,10)= (Gu.Blocks.w_HGAboom_4.NominalValue)^2;
HGA.Krofs(11,11)= (Gu.Blocks.w_HGAboom_5.NominalValue)^2;
HGA.Krofs(12,12)= (Gu.Blocks.w_HGAboom_6.NominalValue)^2;

PAYLOAD.Krofs_telescopeSIMULATOR(7,7)= (Gu.Blocks.w_Telescopestructure_1.NominalValue)^2;
PAYLOAD.Krofs_telescopeSIMULATOR(8,8)= (Gu.Blocks.w_Telescopestructure_2.NominalValue)^2;
PAYLOAD.Krofs_telescopeSIMULATOR(9,9)= (Gu.Blocks.w_Telescopestructure_3.NominalValue)^2;
PAYLOAD.Krofs_telescopeSIMULATOR(10,10)= (Gu.Blocks.w_Telescopestructure_4.NominalValue)^2;
PAYLOAD.Krofs_telescopeSIMULATOR(11,11)= (Gu.Blocks.w_Telescopestructure_5.NominalValue)^2;

PAYLOAD.Struct=struct('w_Telescopestructure_1',TF_telescope.Blocks.w_Telescopestructure_1.NominalValue,...
                       'w_Telescopestructure_2',TF_telescope.Blocks.w_Telescopestructure_2.NominalValue,...
                       'w_Telescopestructure_3',TF_telescope.Blocks.w_Telescopestructure_3.NominalValue,...
                       'w_Telescopestructure_4',TF_telescope.Blocks.w_Telescopestructure_4.NominalValue,...
                       'w_Telescopestructure_5',TF_telescope.Blocks.w_Telescopestructure_5.NominalValue);


SA.theta_SA_simscape=4*atan(Gu.Blocks.tan_theta_SA_div4.NominalValue);

% The uncertain parameter is parametrized according to tau=tan(theta/4)
%-------------------------------------------------------------------------
% To remember:
% Asymetric configuration of the two SA can be tested with the
% parameter epsilon_SA2_simscape (which by default is zero) which adds
% a further angle of rotation to theta_SA_simscape
SA.epsilon_SA2_simscape=0;
%-------------------------------------------------------------------------