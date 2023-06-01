function framesCell = segmentSignals(signals, numSamplesperFrame)

frames = [];
framesCell = {};

numSegments = floor( size(signals,1) / numSamplesperFrame);
lastFrame = numSegments*numSamplesperFrame;

% resample
for i = 1:size(signals,2)
    signal = signals(:,i);
    
    frame = reshape(signal(1:lastFrame), [], numSamplesperFrame);
    
    % concatenate
    for j = 1:numSegments
        frames = [frames; {frame(j,:)}];
    end

    framesCell(:,i) = frames;
    frames = [];
end


end