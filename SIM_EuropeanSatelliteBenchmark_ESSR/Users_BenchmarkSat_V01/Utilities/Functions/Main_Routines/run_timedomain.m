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

% IMPORTANT: Any use of the present software or part of it (i.g. presentations, official documents, 
% scientific article or report) should be correctly referred to as follows:
% "Sanfedino, F. and Iannelli, P. and Alazard, D. and Pelletier, É. 
% and Bennani, S. and Girouart, B., European Satellite Benchmark 
% for Control Education and Industrial Training, IFAC-PapersOnLine, 
% Volume 58, Issue 16, 2024, pp. 193-198" 
%-------------------------------------------------------------------------




