% Code used for restoring the nominal configuration of simscape

%-------------------------------------------------------------------------
% Copyright (c) ISAE-SUPAERO, All Rights Reserved.
% Paolo Iannelli, Francesco Sanfedino, Daniel Alazard (2024)
%-------------------------------------------------------------------------

Bus.J_B_B_SIM =   usubs(Bus.J_B_B,'J_B_Bxx',Bus.J_B_Bxx.NominalValue,'J_B_Byy',Bus.J_B_Byy.NominalValue,'J_B_Bzz',Bus.J_B_Bzz.NominalValue,...
                    'J_B_Bxy',Bus.J_B_Bxy.NominalValue,'J_B_Byz',Bus.J_B_Byz.NominalValue,'J_B_Bxz',Bus.J_B_Bxz.NominalValue);  % [kg*m^2] Moment of inertia of the central
                                                                                                                          % body B in R_b wrt point B  (used in simscape)
Bus.m_B_SIM =     usubs(Bus.m_B,'m_B',Bus.m_B.NominalValue);
SA.theta_SA_simscape = usubs(SA.theta_SA,'theta_SA',SA.theta_SA.NominalValue);    % [rad] - Value imported in Simscape

if Benchmark.config.status.SA_rot_symmetry== 1
    SA.epsilon_SA2_simscape = usubs(SA.epsilon_SA2,'epsilon_SA2',SA.epsilon_SA2.NominalValue);    % [rad] - Value imported in Simscape
else
    SA.epsilon_SA2_simscape=SA.epsilon_SA2;
end

RWS.RWSw1simscape=usubs(RWS.w1,'RW1',RWS.w1.NominalValue);
RWS.RWSw2simscape=usubs(RWS.w2,'RW2',RWS.w2.NominalValue);
RWS.RWSw3simscape=usubs(RWS.w3,'RW3',RWS.w3.NominalValue);
RWS.RWSw4simscape=usubs(RWS.w4,'RW4',RWS.w4.NominalValue);


slosh.mj_simscape= {usubs(slosh.mj{1},'Slosh_m1',slosh.mj{1}.NominalValue);...
                    usubs(slosh.mj{2},'Slosh_m2',slosh.mj{2}.NominalValue);...
                    usubs(slosh.mj{3},'Slosh_m3',slosh.mj{3}.NominalValue);...
                    usubs(slosh.mj{4},'Slosh_m4',slosh.mj{4}.NominalValue);...
                    usubs(slosh.mj{5},'Slosh_m5',slosh.mj{5}.NominalValue);...
                    usubs(slosh.mj{6},'Slosh_m6',slosh.mj{6}.NominalValue)};  