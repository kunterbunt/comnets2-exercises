function indexloop(iMax, jMax)
for i=0:iMax
    for j=0:jMax
        fprintf('i=%d j+i*25=%d\n', i, j+i*25);
    end
end