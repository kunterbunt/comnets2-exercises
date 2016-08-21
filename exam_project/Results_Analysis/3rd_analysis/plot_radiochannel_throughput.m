function plot_radiochannel_throughput()
    filenames = {'radiochannel_avg_throughput_35-1.csv', 'radiochannel_avg_throughput_35nocctv-1.csv', 'radiochannel_avg_throughput_45-1.csv', 'radiochannel_avg_throughput_45nocctv-1.csv', 'radiochannel_avg_throughput_55-1.csv', 'radiochannel_avg_throughput_55nocctv-1.csv', 'radiochannel_avg_throughput_65-1.csv', 'radiochannel_avg_throughput_65nocctv-1.csv'};    
    numbersOfRuns = [20 20 20 20 20 20 20 20];
    meansVec = [];
    CIsVec = [];
    for i=1:length(filenames)        
        [fileMean, fileCI] = getMeanFromCSV(filenames{1, i}, numbersOfRuns(i));
        fileMean = fileMean./1000; % kbit
        fileMean = fileMean./1000; % Mbit
        CIsVec = [CIsVec; fileCI];
        meansVec = [meansVec; fileMean];
    end
        
    figure    
    hold on
    bar(meansVec)
    %errorbar(1:1:length(filenames), meansVec, CIsVec(1:end, 1), CIsVec(1:end, 2), 'rx')    
    errorbar(1:1:length(filenames), meansVec, CIsVec(1:end, 2) - CIsVec(1:end, 1), 'rx')    
    ylabel('Average Channel Throughput [bit/s]');
    xlabel('Number of students');
    set(gca,'XTickLabel',{'', '35 no CCTV', '35', '45 no CCTV', '45', '55 no CCTV', '55', '65 no CCTV', '65'})
    set(gca,'XTickLabelRotation', 90)
    set(gca,'FontSize',28);
    hold off
end