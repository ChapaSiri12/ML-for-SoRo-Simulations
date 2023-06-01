function plotStepResponsesHelper(sims, forceSetpoints)
for i = 1:length(forceSetpoints)
    subplot(3,3,i)
    hold on
    time = sims{i}.yout{1}.Values.Time;
    forceEstimate = sims{i}.yout{2}.Values.normal.Data;
    normalGroundTruth = sims{i}.yout{3}.Values.Data;

    plot(time, normalGroundTruth)
    plot(time, forceEstimate)
    plot(time, forceSetpoints(i)*ones(1,length(time)))
    box on
    xlabel('t (s)'), ylabel('F (N)')
    ylim([0 2.5])
end
end