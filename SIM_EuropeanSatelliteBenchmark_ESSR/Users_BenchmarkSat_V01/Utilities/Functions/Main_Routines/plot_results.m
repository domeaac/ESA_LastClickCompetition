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

%%  -------------------------------------------------------------------------

