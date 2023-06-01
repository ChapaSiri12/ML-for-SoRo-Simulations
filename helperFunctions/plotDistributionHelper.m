function plotDistributionHelper(predictor, response)
for i = 1:size(predictor,2)
    subplot(3,3,i)
    histogram(predictor(:,i)), title("Sensor " + i), ylabel('count'), xlabel("Strain")
end
subplot(3,3,size(predictor,2)+1), histogram(response), title('Force'), ylabel('count'), xlabel("Force")
end
