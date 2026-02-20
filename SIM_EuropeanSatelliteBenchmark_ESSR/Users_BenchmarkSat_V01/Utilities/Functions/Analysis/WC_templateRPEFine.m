% WC template structure

%-------------------------------------------------------------------------
% Copyright (c) ISAE-SUPAERO, All Rights Reserved.
% Paolo Iannelli, Francesco Sanfedino, Daniel Alazard (2024)
%-------------------------------------------------------------------------

% Load the uncertain model
load('SynthesisModel_NoWeights_2024-09-02_10h05m11s','Gu')
% Load WC RPE Fine Phase
load('Benchmark_FinePointing_2024-04-09_23h55m44s','WCs_FineFSM')

%Provide here the name of the file in which to save the user WC configuration
Name_WCfile='WC_config_RPEfine';

% Create the main structure
WC_data = struct();


WC_data.m_B.Description = 'Bus mass [scalar]';
WC_data.m_B.Value = WCs_FineFSM(1).m_B;  % Replace with value to test here

WC_data.CoM.Description = 'CoM of the bus [3x1]';
WC_data.CoM.Value =  [WCs_FineFSM(1).CoMx;WCs_FineFSM(1).CoMy;WCs_FineFSM(1).CoMz];  % Replace with value to test here

WC_data.J_B_Bxx.Description = 'Bus Moment of inertia J_B_Bxx [scalar]';
WC_data.J_B_Bxx.Value = WCs_FineFSM(1).J_B_Bxx;  % Replace with value to test here

WC_data.J_B_Byy.Description = 'Bus Moment of inertia J_B_Byy [scalar]';
WC_data.J_B_Byy.Value = WCs_FineFSM(1).J_B_Byy;  % Replace with value to test here

WC_data.J_B_Bzz.Description = 'Bus Moment of inertia J_B_Bzz [scalar]';
WC_data.J_B_Bzz.Value = WCs_FineFSM(1).J_B_Bzz;  % Replace with value to test here

WC_data.J_B_Byz.Description = 'Bus Moment of inertia J_B_Byz [scalar]';
WC_data.J_B_Byz.Value = WCs_FineFSM(1).J_B_Byz;  % Replace with value to test here

WC_data.J_B_Bxz.Description = 'Bus Moment of inertia J_B_Bxz [scalar]';
WC_data.J_B_Bxz.Value = WCs_FineFSM(1).J_B_Bxz;  % Replace with value to test here

WC_data.J_B_Bxy.Description = 'Bus Moment of inertia J_B_Bxy [scalar]';
WC_data.J_B_Bxy.Value = WCs_FineFSM(1).J_B_Bxy;  % Replace with value to test here

WC_data.Slosh_m1.Description = 'mass 1 of the sloshing equivalent mechnical model [scalar]';
WC_data.Slosh_m1.Value = WCs_FineFSM(1).Slosh_m1;  % Replace with value to test here

WC_data.Slosh_m2.Description = 'mass 2 of the sloshing equivalent mechnical model [scalar]';
WC_data.Slosh_m2.Value = WCs_FineFSM(1).Slosh_m2;  % Replace with value to test here

WC_data.Slosh_m3.Description = 'mass 3 of the sloshing equivalent mechnical model [scalar]';
WC_data.Slosh_m3.Value = WCs_FineFSM(1).Slosh_m3;  % Replace with value to test here

WC_data.Slosh_m4.Description = 'mass 4 of the sloshing equivalent mechnical model [scalar]';
WC_data.Slosh_m4.Value = WCs_FineFSM(1).Slosh_m4;  % Replace with value to test here

WC_data.Slosh_m5.Description = 'mass 5 of the sloshing equivalent mechnical model [scalar]';
WC_data.Slosh_m5.Value = WCs_FineFSM(1).Slosh_m5;  % Replace with value to test here

WC_data.Slosh_m6.Description = 'mass 6 of the sloshing equivalent mechnical model [scalar]';
WC_data.Slosh_m6.Value = WCs_FineFSM(1).Slosh_m6;  % Replace with value to test here

% The LFT/LPV model is build assuming same uncertainty for the 4 isolator
% Here we have different structures for each wheel isolator if the user
% wants to test different values.
WC_data.RWisol_radial_1.Description = 'Radial RW1 isolator stiffness [scalar]';
WC_data.RWisol_radial_1.Value = WCs_FineFSM(1).RWisol_radial;  % Replace with value to test here

WC_data.RWisol_axial_1.Description = 'Axial RW1 isolator stiffness [scalar]';
WC_data.RWisol_axial_1.Value = WCs_FineFSM(1).RWisol_axial;  % Replace with value to test here

WC_data.RWisol_radial_2.Description = 'Radial RW2 isolator stiffness [scalar]';
WC_data.RWisol_radial_2.Value = WCs_FineFSM(1).RWisol_radial;  % Replace with value to test here

WC_data.RWisol_axial_2.Description = 'Axial RW2 isolator stiffness [scalar]';
WC_data.RWisol_axial_2.Value = WCs_FineFSM(1).RWisol_axial;  % Replace with value to test here

WC_data.RWisol_radial_3.Description = 'Radial RW3 isolator stiffness [scalar]';
WC_data.RWisol_radial_3.Value = WCs_FineFSM(1).RWisol_radial;  % Replace with value to test here

WC_data.RWisol_axial_3.Description = 'Axial RW3 isolator stiffness [scalar]';
WC_data.RWisol_axial_3.Value = WCs_FineFSM(1).RWisol_axial;  % Replace with value to test here

WC_data.RWisol_radial_4.Description = 'Radial RW4 isolator stiffness [scalar]';
WC_data.RWisol_radial_4.Value = WCs_FineFSM(1).RWisol_radial;  % Replace with value to test here

WC_data.RWisol_axial_4.Description = 'Axial RW4 isolator stiffness [scalar]';
WC_data.RWisol_axial_4.Value = WCs_FineFSM(1).RWisol_axial;  % Replace with value to test here

WC_data.m_Iso_and_Payload.Description = 'Isolator mass (Includes isolators and mass of payload components) [scalar]';
WC_data.m_Iso_and_Payload.Value = WCs_FineFSM(1).m_Iso_and_Payload;  % Replace with value to test here

WC_data.J_B_Bxx_isopayload.Description = 'Isolator Moment of Inertia J_B_Bxx (Includes isolators and mass of payload components) [scalar]';
WC_data.J_B_Bxx_isopayload.Value = WCs_FineFSM(1).J_B_Bxx_isopayload;  % Replace with value to test here

WC_data.J_B_Byy_isopayload.Description = 'Isolator Moment of Inertia J_B_Byy (Includes isolators and mass of payload components) [scalar]';
WC_data.J_B_Byy_isopayload.Value = WCs_FineFSM(1).J_B_Byy_isopayload;  % Replace with value to test here

WC_data.J_B_Bzz_isopayload.Description = 'Isolator Moment of Inertia J_B_Bzz (Includes isolators and mass of payload components) [scalar]';
WC_data.J_B_Bzz_isopayload.Value = WCs_FineFSM(1).J_B_Bzz_isopayload;  % Replace with value to test here

WC_data.J_B_Byz_isopayload.Description = 'Isolator Moment of Inertia J_B_Byz (Includes isolators and mass of payload components) [scalar]';
WC_data.J_B_Byz_isopayload.Value = WCs_FineFSM(1).J_B_Byz_isopayload;  % Replace with value to test here

WC_data.J_B_Bxz_isopayload.Description = 'Isolator Moment of Inertia J_B_Bxz (Includes isolators and mass of payload components) [scalar]';
WC_data.J_B_Bxz_isopayload.Value = WCs_FineFSM(1).J_B_Bxz_isopayload;  % Replace with value to test here

WC_data.J_B_Bxy_isopayload.Description = 'Isolator Moment of Inertia J_B_Bxy (Includes isolators and mass of payload components) [scalar]';
WC_data.J_B_Bxy_isopayload.Value = WCs_FineFSM(1).J_B_Bxy_isopayload;  % Replace with value to test here

WC_data.RW1_speed.Description = 'RW1_speed [scalar] - rad/s (MAX SPEED 4000 RPM)';
WC_data.RW1_speed.Value = WCs_FineFSM(1).RW1;  % Replace with value to test here

WC_data.RW2_speed.Description = 'RW2_speed [scalar] - rad/s (MAX SPEED 4000 RPM)';
WC_data.RW2_speed.Value = WCs_FineFSM(1).RW2;  % Replace with value to test here

WC_data.RW3_speed.Description = 'RW3_speed [scalar] - rad/s (MAX SPEED 4000 RPM)';
WC_data.RW3_speed.Value = WCs_FineFSM(1).RW3;  % Replace with value to test here

WC_data.RW4_speed.Description = 'RW4_speed [scalar] - rad/s (MAX SPEED 4000 RPM)';
WC_data.RW4_speed.Value = WCs_FineFSM(1).RW4;  % Replace with value to test here

WC_data.SA1_om_1.Description = 'Solar array 1 - 1st natural frequency [scalar] (rad/s)';
WC_data.SA1_om_1.Value = WCs_FineFSM(1).w_SolarArray1_1;  % Replace with value to test here

WC_data.SA1_om_2.Description = 'Solar array 1 - 2nd natural frequency [scalar] (rad/s)';
WC_data.SA1_om_2.Value = WCs_FineFSM(1).w_SolarArray1_2;  % Replace with value to test here

WC_data.SA1_om_3.Description = 'Solar array 1 - 3rd natural frequency [scalar] (rad/s)';
WC_data.SA1_om_3.Value = WCs_FineFSM(1).w_SolarArray1_3;  % Replace with value to test here

WC_data.SA1_om_4.Description = 'Solar array 1 - 4th natural frequency [scalar] (rad/s)';
WC_data.SA1_om_4.Value = WCs_FineFSM(1).w_SolarArray1_4;  % Replace with value to test here

WC_data.SA1_om_5.Description = 'Solar array 1 - 5th natural frequency [scalar] (rad/s)';
WC_data.SA1_om_5.Value = WCs_FineFSM(1).w_SolarArray1_5;  % Replace with value to test here

WC_data.SA1_om_6.Description = 'Solar array 1 - 6th natural frequency [scalar] (rad/s)';
WC_data.SA1_om_6.Value = WCs_FineFSM(1).w_SolarArray1_6;  % Replace with value to test here



WC_data.SA2_om_1.Description = 'Solar array 2 - 1st natural frequency [scalar] (rad/s)';
WC_data.SA2_om_1.Value = WCs_FineFSM(1).w_SolarArray2_1;  % Replace with value to test here

WC_data.SA2_om_2.Description = 'Solar array 2 - 2nd natural frequency [scalar] (rad/s)';
WC_data.SA2_om_2.Value = WCs_FineFSM(1).w_SolarArray2_2;  % Replace with value to test here

WC_data.SA2_om_3.Description = 'Solar array 2 - 3rd natural frequency [scalar] (rad/s)';
WC_data.SA2_om_3.Value = WCs_FineFSM(1).w_SolarArray2_3;  % Replace with value to test here

WC_data.SA2_om_4.Description = 'Solar array 2 - 4th natural frequency [scalar] (rad/s)';
WC_data.SA2_om_4.Value = WCs_FineFSM(1).w_SolarArray2_4;  % Replace with value to test here

WC_data.SA2_om_5.Description = 'Solar array 2 - 5th natural frequency [scalar] (rad/s)';
WC_data.SA2_om_5.Value = WCs_FineFSM(1).w_SolarArray2_5;  % Replace with value to test here

WC_data.SA2_om_6.Description = 'Solar array 2 - 6th natural frequency [scalar] (rad/s)';
WC_data.SA2_om_6.Value = WCs_FineFSM(1).w_SolarArray2_6;  % Replace with value to test here



WC_data.w_HGAboom_1.Description = 'HGA boom - 1st natural frequency [scalar] (rad/s)';
WC_data.w_HGAboom_1.Value = WCs_FineFSM(1).w_HGAboom_1;  % Replace with value to test here

WC_data.w_HGAboom_2.Description = 'HGA boom - 2nd natural frequency [scalar] (rad/s)';
WC_data.w_HGAboom_2.Value = WCs_FineFSM(1).w_HGAboom_2;  % Replace with value to test here

WC_data.w_HGAboom_3.Description = 'HGA boom - 3rd natural frequency [scalar] (rad/s)';
WC_data.w_HGAboom_3.Value = WCs_FineFSM(1).w_HGAboom_3;  % Replace with value to test here

WC_data.w_HGAboom_4.Description = 'HGA boom - 4th natural frequency [scalar] (rad/s)';
WC_data.w_HGAboom_4.Value = WCs_FineFSM(1).w_HGAboom_4;  % Replace with value to test here

WC_data.w_HGAboom_5.Description = 'HGA boom - 5th natural frequency [scalar] (rad/s)';
WC_data.w_HGAboom_5.Value = WCs_FineFSM(1).w_HGAboom_5;  % Replace with value to test here

WC_data.w_HGAboom_6.Description = 'HGA boom - 6th natural frequency [scalar] (rad/s)';
WC_data.w_HGAboom_6.Value = WCs_FineFSM(1).w_HGAboom_6;  % Replace with value to test here


WC_data.w_Telescopestructure_1.Description = 'Telescope structure - 1st natural frequency [scalar] (rad/s)';
WC_data.w_Telescopestructure_1.Value = WCs_FineFSM(1).w_Telescopestructure_1;  % Replace with value to test here

WC_data.w_Telescopestructure_2.Description = 'Telescope structure - 2nd natural frequency [scalar] (rad/s)';
WC_data.w_Telescopestructure_2.Value = WCs_FineFSM(1).w_Telescopestructure_2;  % Replace with value to test here

WC_data.w_Telescopestructure_3.Description = 'Telescope structure - 3rd natural frequency [scalar] (rad/s)';
WC_data.w_Telescopestructure_3.Value = WCs_FineFSM(1).w_Telescopestructure_3;  % Replace with value to test here

WC_data.w_Telescopestructure_4.Description = 'Telescope structure - 4th natural frequency [scalar] (rad/s)';
WC_data.w_Telescopestructure_4.Value = WCs_FineFSM(1).w_Telescopestructure_4;  % Replace with value to test here

WC_data.w_Telescopestructure_5.Description = 'Telescope structure - 5th natural frequency [scalar] (rad/s)';
WC_data.w_Telescopestructure_5.Value = WCs_FineFSM(1).w_Telescopestructure_5;  % Replace with value to test here

WC_data.theta_SA.Description = 'Solar arrays initial angular configuration [scalar] - rad';

% README: If the WC for the rotation is computed with the LFT/LPV model
% provided by ISAE-SUPAERO the uncertain variable is SIGMA = tan(theta/4)
% where SIGMA varies between -1 and 1; Thus if the user uses that
% value in the following function he has to add 4*atan(SIGMA)
WC_data.theta_SA.Value = WCs_FineFSM(1).tan_theta_SA_div4;  % Replace with value to test here


WC_data.theta_SA2_epsilon.Description = 'Solar array 2  additional - used to test asymetric configuration of the two SAs [scalar] - rad';
WC_data.theta_SA2_epsilon.Value = 0;  % Replace with value to test here
% Display the structure
disp(WC_data);


save(['.',filesep,'Solutions_freqDomain',filesep,Name_WCfile],'WC_data');

