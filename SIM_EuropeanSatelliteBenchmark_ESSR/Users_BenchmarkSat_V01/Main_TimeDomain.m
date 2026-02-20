%%------------------------------------------------------------------------
% This code is for running time domain simulations. 3 types of simulation
% can be run:
% 1) Time doman with Nominal value configuration (found in file <config_A> inside
%    the path \Utilities\Functions\Simulator)
% 2) Time domain with worst case configuration 
%    use the code "WC_template" in folder Utilities\Functions\Analysis
%    to generate a .mat (here the file is called WC_config)
% 3) Monte Carlo runs.
% 
% Call the .m file (Analysis_Initialization) with the shared code/data among
% the 3 types of simulation
%------------------------------------------------------------------------

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
clear all, close all, clc

%% ------------------------------------------------------------------------
% Adding the folders to matlab path
%--------------------------------------------------------------------------

addpath(genpath('./SDT_model/'));  % Add the folder with the file for
                                         % Frequency domain analysis
addpath(genpath('./Synthesis_model/'));  % Add the folder with the file for
                                         % Frequency domain analysis
addpath(genpath('./Utilities/')); % Add the folder with SDTlib and other used
                                  % functions in the matlab path
addpath(genpath('./Solutions_freqDomain/')); % Add the folder with the solutions

addpath(genpath('./Solutions_TimeDomain/')); % Add the folder with the solutions

addpath(genpath('./Simscape_model/')); % Add the folder
                                   % with Simscape model, FE data and codes


% Name of the simulink file containing the simulator                                        
sys_name='Simscape_Benchmark_SIM1';

%%  Time domain Initialization script
TimeDomain_Initialization

%% ==========================================================================
%                            USER SETTINGS
% Only the following section can be modified by the user
% It is not advised to change other parts of the code
%
%  ==========================================================================
%% ------------------------------------------------------------------------
% Definition of the timeline for the benchmark problem
%--------------------------------------------------------------------------

PHASE.Ttotal = 2700; % Total duration of the benchmark problem
 
% The duration that are not fixed are the slew and the two transitions
PHASE.Slew.TimeCheck  = 100;    % Control to check if the APEreq of the slew (at steady state) is met
 
PHASE.Coarse.Duration = 600;  % Duration of the coarse phase
 
 
% DeltaT in which the Coarse req. should be met to initialize coarse steady-state phase
PHASE.TransitionS2C.TimeCheck=30;
PHASE.TransitionS2C.TimeCheck_reqNotMet=360;
% DeltaT in which the Coarse req. should be met to initialize fine steady-state phase
PHASE.TransitionC2F.TimeCheck=60;   % Modified from 30s to implement a slower transition
PHASE.TransitionC2F.TimeCheck_reqNotMet=360;
%% Controllers Initialization

Baseline_Controller
% Note for the user: the controller provided in Baseline_Controller is the
% baseline controller developed by ISAE-SUPAERO. The user can propose his
% own solution as described in the User Manual

%% ------------------------------------------------------------------------
% Select which type of analysis to run (Only one of the 3 can be selected
% at a time):
%
% ANALYSYS_TYPE = 1 if NOMINAL MODE ANALYSIS (all uncertain value are set to their nominal value
%                                             as in file Config_Nominal.m)
% ANALYSYS_TYPE = 2 if WORST-CASE (OR USER DEFINED) CONFIGURATION ANALYSIS
% ANALYSYS_TYPE = 3 if MONTE CARLO ANALYSIS 
%
%--------------------------------------------------------------------------
ANALYSYS_TYPE = 1; 
%-------------------------------------------------------------------------

% IF SELECTION OF A WORST-CASE CONFIGURATION (OR USER DEFINED)
% use the code "WC_template" in folder Utilities\Functions\Analysis
% to generate a .mat (here the file is called WC_config)
Analysis.WCfileName='WC_config_RPEfine';

% IF SELECTION OF MONTE CARLO ANALYSIS PLEASE DEFINE THE FOLLOWING
% PARAMETERS
MCsim.num_batches = 1; % Number of batches to run (each batch will be saved into a separate file)
MCsim.freecores = 0;   % Select the numbers of cores to not use for the parallel pool
MCsim.num_sub_batches = 6; % Number of sub-batches

% Name saved .mat file for Nominal and WC analysis
Name_Save_Nominal=      'Nominal_Synthesis';
Name_Save_NominalData=  'Nominal_Synthesis_data';

Name_Save_WC=       'Benchmark_WC_fine';
Name_Save_WCData=   'Benchmark_WC_fine_data';


%% ------------------------------------------------------------------------
% State the actuators used during the benchmark (are just used to clean up
% the output file of the simulator from unnecessary variables) -> reduce
% size
%--------------------------------------------------------------------------
Actuators.RW.Select=1; %  [0/1] Activation Reaction Wheels
Actuators.RCS.Select=1; % [0/1] Activation Reaction Control System
Actuators.MPS.Select=0; % [0/1] Activation Micro-Propulsion System
Actuators.FSM.Select=1; % [0/1] Activation Fast Steering Mirror
Actuators.PMA.Select=0; % [0/1] Activation Proof-Mass Actuators

%% ------------------------------------------------------------------------
% ACTIVATION OF DISTURBANCES, NOISE AND RW MODELS
%--------------------------------------------------------------------------

% -------------------------------------------------------------------------
% DISTURBANCES SELECTION
%--------------------------------------------------------------------------
     
% RWS submodel
Benchmark.config.status.RWS_Harmdist =          1; % 1 for Harmonic disturbances with static/dynamic mass imbalances
Benchmark.config.status.RWS_Sat =               1; % 1 for saturation block (No friction model and no friction spike)
Benchmark.config.status.RWS_Fric =              1; % 1 for Friction model (Stribeck-like model)
Benchmark.config.status.RWS_Frict_spikes =      1; % 1 for Friction spikes generation

% RW broadband disturbance
Disturbance.RW.BroadBand.SelectSim =   1; % 0/1

% RW Torque noise (it is an additional term that enters directly the
% command of the RW)
Disturbance.RW.TorqueNoise.SelectSim =   1; % 0/1 

% Orbital disturance
Disturbance.External.SelectSim =       1; % 0/1

% SADM (sinusoidal + broadband disturbance)
Disturbance.SADM.SelectSim =           1; % 0/1
Disturbance.SADM.BroadBand.SelectSim = 1; % 0/1

%% -------------------------------------------------------------------------
% NOISE SELECTION
%--------------------------------------------------------------------------
Sensors.SST.SelectSim       = 1;
Sensors.GYROc.SelectSim     = 1;
Sensors.GYROc.BiasInstability_SelectSim = 1;

Sensors.GYROf.SelectSim     = 0;
Sensors.GYROf.BiasInstability_SelectSim = 0;

Sensors.FGS.SelectSim       = 1;
Sensors.ACCm1.SelectSim     = 1;
Sensors.ACCm2.SelectSim     = 1;
Sensors.ACCdect.SelectSim   = 1;
Sensors.FSM.SelectSim       = 1;
Sensors.RW_tachometer.SelectSim= 1;

%% -------------------------------------------------------------------------
% ACTUATION THRUSTERS
%--------------------------------------------------------------------------
Actuators.RCS.SelectFullModel = 1; %Thruster allocation and PWM
Actuators.RCS.SelectNoPWM = 0; % Only thuster allocation but no PWM
Actuators.RCS.SelectIdeal = 0; % Direct application of the torque (No allocation)

%% RUN ANALYSIS
run_timedomain
