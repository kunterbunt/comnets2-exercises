function confidenceIntervals = evaluate(filename, numberOfRuns)

values = csvread(filename);
valuesPerRun = length(values)/numberOfRuns;

% sampleMeanVector = [];
 
% for i=1:numberOfRuns-1
%     sampleMeanVector(end+1) = mean(values(i*valuesPerRun:i*valuesPerRun+valuesPerRun));
% end
% sampleMeanVector(end+1) = mean(values(numberOfRuns*valuesPerRun:end))

confidenceIntervals = [];
for i=0:numberOfRuns-1
%     fprintf('from=%d to=%d\n', max(i*valuesPerRun, 1), i*valuesPerRun+valuesPerRun);
    currentValues = values(max(i*valuesPerRun, 1):i*valuesPerRun+valuesPerRun);    
    standardError = std(currentValues)/sqrt(length(currentValues));
    tscore = tinv([0.025  0.975], length(currentValues)-1);
    confidenceIntervals = [confidenceIntervals; mean(currentValues) + tscore*standardError];
end

