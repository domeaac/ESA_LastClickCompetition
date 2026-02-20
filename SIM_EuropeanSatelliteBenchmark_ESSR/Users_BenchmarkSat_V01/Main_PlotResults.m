%% ------------------------------------------------------------------------
% This code provides the results of the time-domain analysis 
%------------------------------------------------------------------------

% Input file (.mat) name
%------------------------------------------------------------------------
% Tutorial: According to the provided inputs the codes manages how the
% results are visualized. The user can provide the name of the .mat
% containing the results (up to 1 models (with a single model config.) and
% 1 Monte Carlo run.
% 
% - if an input is an empty string '' for an input then no results are
%   visualized for that particular input.
%
% In this way the following case can be studied and compared:

%       1) Only Model A (could be the nominal or a WC config)
%          In this case InputFile_Model_B=''; and InputFile_Montecarlo = ''; 
%       
%       2) Model A + Model B (used to compare 2 models)
%          - for instance for comparing the Nominal config with a WC
%       
%       3) Model A + MonteCarlo (used to compare 1 model with the Monte Carlo)
%
% 
% NOTE: Providing only Model B without a model A gives an error. If you
% have only a single result with a particular configuration use the input
% for "Model A".
%------------------------------------------------------------------------

%-------------------------------------------------------------------------
% Copyright (c) ISAE-SUPAERO, All Rights Reserved.
% Paolo Iannelli, Francesco Sanfedino, Daniel Alazard (2024)
%-------------------------------------------------------------------------

%% -----------------------------------------------------------------------
close all, clear all

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

addpath(genpath('./Simscape/')); % Add the folder
                                 % with Simscape model, FE data and codes
addpath(genpath('./TimeDomainAnalysis/')); % Add the folder
                                           % with the time-domain model and codes

% -------------------------------------------------------------------------                                           
%% Only the following section can be modified by the user.
% It is not advised to change other parts of the code.
                                                  
% ------------------------------------------------------------------------
% HERE THE USER CAN PROVIDE THE NAME OF THE 2 .MAT IN THE FOLDER
% "Solutions_TimeDomain"
% -------------------------------------------------------------------------
% Input file (.mat) name
InputFile_Model_A =       'Nominal_Synthesis_2026-01-24_15h40m49s'; % Exemple of solution file
InputFile_Model_A_data =  'Nominal_Synthesis_Data_2026-01-24_15h40m49s'; % Exemple of solution file

% Input file (.mat) name
 InputFile_Model_B = '';
 InputFile_Model_B_data = '';
%InputFile_Model_B = 'Benchmark_WC_2025-03-24_17h31m55s'; % Exemple of solution file
%InputFile_Model_B_data = 'Benchmark_WC_Data_2025-03-24_17h31m55s'; % Exemple of solution file
% ------------------------------------------------------------------------
% HERE THE USER CAN PROVIDE THE NAME OF THE FOLDER CONTAINING THE MC RUNS
% IN "Solutions_TimeDomain"
% -------------------------------------------------------------------------
InputFile_MonteCarlo = 'MonteCarlo_2026-01-18_17h05m04s';
%InputFile_MonteCarlo = 'MonteCarlo_2025-03-29_14h53m37s'; % Exemple of
%solution folder
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% Specify here the factor to undersample data in plots to avoid out of 
% memory issues in plotting monte carlo
K_undersample=10;  
%--------------------------------------------------------------------------

% END OF SECTION MODIFIABLE BY USERS
%%  -------------------------------------------------------------------------

% Generate Plots
plot_results

