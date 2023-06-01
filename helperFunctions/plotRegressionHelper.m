function plotRegressionHelper(predictions, groundTruth)
testRMSE = rms(groundTruth - predictions);
scatter(predictions, groundTruth, 5,[0 75/255 135/255], 'filled'), xlabel('predictions'), ylabel('actual') , box on, title("Test RMSE = " + testRMSE)
hold on, plot(min(groundTruth):1e-2:max(groundTruth),min(groundTruth):1e-2:max(groundTruth), 'color', 0.8*[1 135/255 75/255],'linewidth',1.5)
end