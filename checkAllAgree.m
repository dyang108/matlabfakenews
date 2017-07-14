function allResults = checkAllAgree(t, model, sents)
% model and sents are loaded from the file demoObjects.mat
    s = 2000 %size(t);
    orig = t.Stance;
    result = cell(s(1), 1);
    for i = 1:s(1)
        result{i} = doesAgree(t.Headline(i), t.articleBody(i), model, sents);
    end
    original = orig(1:s);
    allResults = table(original, result);
end