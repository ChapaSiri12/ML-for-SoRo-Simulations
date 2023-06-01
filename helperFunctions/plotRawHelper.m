function plotRawHelper(strainSensorReadings, forceGroundTruth)
subplot(2,1,1), plot(strainSensorReadings), title('Strain Sensor Data'), ylabel('$\varepsilon$','Interpreter',"latex"), xlabel('samples')
subplot(2,1,2), plot(forceGroundTruth), title('Ground Truth Force'), ylabel('F (N)','Interpreter',"latex"), xlabel('samples')
end