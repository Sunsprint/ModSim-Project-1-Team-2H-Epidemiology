% Wave 1 - Mutagen v.1
% Defines Rates of Transfer (Flows)
beta = 1/50; % Infection Rate
gamma = 1/2; % Recovery rate in 1/weeks
population = 100;
i1_0 = 1; % Number of initial infections
s1_0 = population - i1_0;
r1_0 = 0; 
masks = 1/5;
num_steps = 40; % Number of weeks Simulated
figure(1); clf; hold on

for a = 0.1:0.1:0.9
    [S,I,R,W]=sir_v1_simulate_mask(s1_0, i1_0, r1_0, beta, a, gamma, num_steps, masks);
    plot(W,I); label1 = "Wave 1";
end
hold off