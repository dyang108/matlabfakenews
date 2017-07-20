function [] = plotResults(results)
    c = categorical({'unrelated', 'agree', 'disagree', 'discuss'});
    d = zeros(4, 2);
    uncat = zeros(4, 1);
    for i = 1:height(results)
        switch results.original{i}
            case 'unrelated'
                r = 1;
            case 'agree'
                r = 2;
            case 'disagree'
                r = 3;
            case 'discuss'
                r = 4;
        end
        d(r, 1) = d(r, 1) + 1;
        if strcmp(results.original(i), results.result(i))
            d(r, 2) = d(r, 2) + 1;
        else
            uncat(r) = uncat(r) + 1;
        end
    end
    subplot(2, 1, 1);
    bar(c, d);
    set(gca, 'YScale', 'log');
    ax1 = gca;
    ax1.Title.String =  'Results of empirical analysis of test articles';
    l = legend('Total articles', 'Articles categorized correctly');
    l.Location = 'northwest';
    subplot(2, 1, 2);
    bar(c, uncat);
    ax2 = gca;
    ax2.Title.String = 'Total incorrect per category';
    ax2.YLim = [0, 4000];
end
    