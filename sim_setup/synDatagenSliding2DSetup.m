clear;

model = 'finger_datagen_sliding_2D';
open_system(model)

%% Simulate system
XdotSetpoints = linspace(1,10,3);
ZdotSetpoints = [0.05 0.2];

% initialise fast settings
set_param(model,'FastRestart','on') % disable re-compile at start
set_param(model,'SimMechanicsOpenEditorOnUpdate','off');   % disable Simscape visualisation

in = Simulink.SimulationInput(model);

% set params
counter = 1;
for i = 1:length(XdotSetpoints)
    for j = 1:length(ZdotSetpoints)
        in = Simulink.SimulationInput(model);
        inputs(counter) = in.setBlockParameter([model, '/random walker/random dx'],'Variance', num2str(ZdotSetpoints(j)));
        inputs(counter) = inputs(counter).setBlockParameter([model, '/random walker/random dx'],'Variance', num2str(XdotSetpoints(i)));
        counter = counter + 1;
    end
end

%%

simout = parsim(inputs, 'ShowSimulationManager','on');

% reset settings
set_param(model,'FastRestart','off')
set_param(model,'SimMechanicsOpenEditorOnUpdate','on');   