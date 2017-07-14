function percentScore = getGrade(results)
    s = size(results);
    correct = 0;
    for i = 1:s(1)
        if strcmp(results.original(i), results.result(i))
            correct = correct + 1;
        end
    end
    percentScore = (correct / s(1)) * 100;
end