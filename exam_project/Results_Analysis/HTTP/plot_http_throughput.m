function plot_http_throughput()
    filenames = {'../3rd_analysis/new-two-ThirtyfiveStudentsNOCCTV-rcvdPkSumBytes-1.csv', '../3rd_analysis/new-two-ThirtyfiveStudents-rcvdPkSumBytes-1.csv', '../3rd_analysis/new-two-FourtyfiveStudentsNOCCTV-rcvdPkSumBytes-1.csv', '../3rd_analysis/new-two-FortyfiveStudents-rcvdPkSumBytes-1.csv', '../3rd_analysis/new-two-FiftyfiveStudentsNOCCTV-rcvdPkSumBytes-1.csv', '../3rd_analysis/new-two-FiftyfiveStudents-rcvdPkSumBytes-1.csv', '../3rd_analysis/new-two-SixtyfiveStudentsNOCCTV-rcvdPkSumBytes-1.csv', '../3rd_analysis/new-two-SixtyiveStudents-rcvdPkSumBytes-1.csv'};    
    numbersOfStudents = [35 35 45 45 55 55 65 65];
    meansVec = [];
    CIsVec = [];
    for i=1:length(filenames)        
        [fileMean, fileCI] = getMeanFromCSV(filenames{1, i}, numbersOfStudents(i));
        fileMean = fileMean./1000; % kB        
        fileCI = fileCI./1000;
        fileMean = fileMean./1000; % MB
        fileCI = fileCI./1000;
        CIsVec = [CIsVec; fileCI];
        meansVec = [meansVec; fileMean];
    end
        
    figure    
    hold on
    bar(meansVec)
    %errorbar(1:1:length(filenames), meansVec, CIsVec(1:end, 1), CIsVec(1:end, 2), 'rx')    
    errorbar(1:1:length(filenames), meansVec, CIsVec(1:end, 2) - CIsVec(1:end, 1), 'rx')    
    ylabel('Total Download Traffic [MB]');
    xlabel('Number of students');
    set(gca,'XTickLabel',{'', '35 no CCTV', '35', '45 no CCTV', '45', '55 no CCTV', '55', '65 no CCTV', '65'})
    set(gca,'XTickLabelRotation', 90)
    set(gca,'FontSize',28);
    hold off
end