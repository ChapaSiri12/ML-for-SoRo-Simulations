% Loads finger parameters for any of the finger models in this fodler

load('final_sensor_locs'); % XYZ location of strain sensors

fL = 120;       % Finger length mm
D = 16;         % Finger diameter mm
dl = 5;         % No. discretized elements
L = fL/dl;      % Length of each element
rho = 100;      % Density of material
K = 0.0016;     % Stiffness in finger
M = 0.000005;   % Damping in finger

% Set control parameters
Rx = 0; % Finger rotation from horizontal
initPos = [10+((fL+(fL/dl)+5)*cos(Rx)) 0 D/2+70+((fL+(fL/dl)+5)*sin(Rx))]; % Initial position of finger

% TODO: add definitions, it is unclear to me what some of these parameters are
Az = 15;
f1 = 2;
f2 = 0.5;
t1 = 1;
t2 = 0.5;
Ta = t1;
Tb = t1+1/f1; 
Tc = t1+1/f1+t2;
Td = t1+1/f1+t2+1/f2;

% Sensor sample frequency
cf = 25; % Hz
bounds = [0; -15];