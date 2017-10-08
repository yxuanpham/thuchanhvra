function StatisticTestImageLabel(filename)
    fprintf('\n Load label test');
    lblTestAll = loadMNISTLabels('../lecture02/data/t10k-labels.idx1-ubyte');
    u = unique(lblTestAll);
    n  = histc(lblTestAll,u);
    s = horzcat(u,n)
    csvwrite(filename, s);
end