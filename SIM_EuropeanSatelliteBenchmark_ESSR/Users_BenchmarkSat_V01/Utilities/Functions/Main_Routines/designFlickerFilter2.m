function [flickerfilter, z, p] = designFlickerFilter(fcorner)
% Create an ss object that approximates the combination of an additive
% white gaussian noise (AWGN) process above a predefined corner frequency,
% transitioning to a flicker process (1/f) below the corner frequency.
%
% Inputs:
% fcorner: Corner frequency, in Hz
%
% Outputs:
% flickerfilter: An ss object that approximates the combination of an AWGN
% and a flicker process
%
% The approximation consists pole/zero pairs, where the zero frequency is
% higher than the pole frequency by a factor of the square root of 10, and
% the pole/zero pairs are separated by a factor of ten. Each pole/zero pair
% adds a decade to the frequency span of the approximation.

% Copyright 2022, The MathWorks Inc.
pzfactor = 10;
% Other possible pzfactors, from msblks.VCO.configureRingOscillator are
% Flicker exponent pzfactor
%   -0.8            5.5
%   -0.9            7.7
%   -1.0            10
%   -1.1            14
%   -1.2            17
%   -1.3            22
%   -1.4            29
%   -1.5            36
if fcorner <= 0
    flickerfilter = ss(0,0,0,1);
else
    poles = 2*pi*fcorner*[-0.000001,-0.00001,-0.0001,-0.001,-0.01,-0.1,-1]/6;
    zeroz = poles*sqrt(pzfactor);
    zpkform = zpk(zeroz,poles,1);
    flickerfilter = ss(zpkform);
end
z = zeroz;
p = poles;
end
