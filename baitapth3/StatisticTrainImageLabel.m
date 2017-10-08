function StatisticTrainImageLabel(filename)
    fprintf('\n Load label train');
    lblTrainAll = loadMNISTLabels('../lecture02/data/train-labels.idx1-ubyte');
    u = unique(lblTrainAll);
    n  = histc(lblTrainAll,u);
    s = horzcat(u,n);
    csvwrite(filename, s);
end