function determineDistribution(filename)
    file = fopen(filename, 'r');
    values = fscanf(file, '%d');
%     [D, PD] = allfitdist(values, 'PDF');
%     D(1)
%     chi2gof(values, 'Exponential', 0.05)
    [h,p] = lillietest(values,'Distribution','exp')
    expfit(values)
end