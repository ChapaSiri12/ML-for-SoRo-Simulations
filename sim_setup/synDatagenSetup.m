clear;
loadFingerParams;

open_system('finger_datagen')

%% Simulate system
SimTime = 3900;
simout = sim('finger_datagen', SimTime);
