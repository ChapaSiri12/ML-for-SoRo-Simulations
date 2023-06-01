function plotCorrelationHelper(strainSensorReadings, forceGroundTruth)

numplots = size(strainSensorReadings,2);

rownumplots = ceil(sqrt(numplots));


for i = 1:numplots
    subplot(rownumplots,rownumplots,i)
    scatter(strainSensorReadings(:,i), forceGroundTruth, 3, 1:length(forceGroundTruth),'filled')
    xlabel('Strain'), ylabel('Force'), box on
    title("Sensor " + string(i))
end
end