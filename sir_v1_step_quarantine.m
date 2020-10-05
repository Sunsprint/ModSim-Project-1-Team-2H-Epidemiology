function [s1_n, i1_n, r1_n] = sir_v1_step(s1, i1, r1, q1, beta, gamma)
% fcn_step Advance an SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n] = fcn_step(s, i, r, beta, gamma)
% 
% Arguments
%   s1 = current number of susceptible individuals (v1 virus)
%   i1 = current number of infected individuals (v1 virus)
%   r1 = current number of recovered individuals (v1 virus)
%   q1 = current number of quarantined individuals (v1 virus)
%
%   beta = infection rate (v1) parameter
%   gamma = recovery rate (v1) paramter
% 
% Returns
%   s1_n = next number of susceptible individuals (v1)
%   i1_n = next number of infected individuals (v1)
%   r1_n = next number of recovered individuals (v1)

% compute new infections and recoveries
infected1 = round(beta * i1 * s1, 0);
recovered1 = round(gamma * i1, 0);

% Update state
s1_n = s1 - infected1;
i1_n = i1 + infected1 - recovered1;
r1_n = r1 + recovered1;

%assume rate of false negatives is 25%
%assume rate of false positives is 14%

testS_neg = round(s1 * .86, 0); %number of susceptible people (not infected) who accurately test negative
testS_pos = s1 - testS_neg; %number of susceptible people who have false positive test result
testI_neg = round(i1 * .25, 0); %number of infected people who have false negative test result
testI_pos = i1 - testI_neg; %number of infected people who accurately test positive
testR_neg = round(r1 * .86, 0); %number of recovered people who accurately test negative
testR_pos = r1 - testR_neg; %number of recovered people who have false positive test result

q1 = testS_pos + testI_pos + testR_pos; %people who test positive get quarantined


% Enforce invariants; necessary since we're doing a discrete approx.
s1_n = max(s1_n, 0);
i1_n = max(i1_n, 0);
r1_n = max(r1_n, 0);
    
end