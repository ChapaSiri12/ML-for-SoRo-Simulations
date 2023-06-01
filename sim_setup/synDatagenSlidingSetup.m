clear;

model = 'finger_datagen_sliding';
open_system(model)

%% Simulate system
XdotSetpoints = linspace(1,10,5);
ZSetpoints = linspace(-3,0,6);

% initialise fast settings
set_param(model,'FastRestart','on') % disable re-compile at start
set_param(model,'SimMechanicsOpenEditorOnUpdate','off');   % disable Simscape visualisation

in = Simulink.SimulationInput(model);

% set params
counter = 1;
for i = 1:length(XdotSetpoints)
    
    for j = 1:length(ZSetpoints)
        in = Simulink.SimulationInput(model);
        inputs(counter) = in.setBlockParameter([model, '/random walker/z'],'Value', num2str(ZSetpoints(j)));
        inputs(counter) = inputs(counter).setBlockParameter([model, '/random walker/random dx'],'Variance', num2str(XdotSetpoints(i)));
        counter = counter + 1;
    end
end

%%

simout = parsim(inputs, 'ShowSimulationManager','on');

% reset settings
set_param(model,'FastRestart','off')
set_param(model,'SimMechanicsOpenEditorOnUpdate','on');   