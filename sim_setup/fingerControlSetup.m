load('final_sensor_locs');

%% Set parameters of finger

fL = 120; %Finger length mm
D = 16; %Finger diameter mm
dl = 5; %No. discretized elements
L = fL/dl; %Length of each element
rho = 100; %Density of material
K = 0.0016; %Stiffness in finger
M = 0.000005; %Damping in finger
%mu = 0.8;
%muV = 0.78;

%% Set control parameters
Rx = 0; %Finger rotation from horizontal
initPos = [10+((fL+(fL/dl)+5)*cos(Rx)) 0 D/2+70+((fL+(fL/dl)+5)*sin(Rx))]; %Initial position of finger
Az = 15;
f1 = 2;
f2 = 0.5;
t1 = 1;
t2 = 0.5;
Ta = t1;
Tb = t1+1/f1;
Tc = t1+1/f1+t2;
Td = t1+1/f1+t2+1/f2;

% control frequency
cf = 25; %Hz

% sensor parameters
bounds = [0; -15];
driftweights = zeros(8,2);
for i = 1:8
    for j = 1:3
        if sensor_locs(i,j) > 0
            driftweights(i,1) = driftweights(i,1)+sin(sensor_locs(i,j));
        end
    end
end
driftweights(:,2) = [1.8;1.5;2.2;0.2;1.5;2.2;0.8;2.2];    
%driftweights = driftweights/4.37;

%% Load state estimation models
load lstm1.mat
load ensembleModel.mat
load slidingContactModel.mat
load linRegModel.mat
