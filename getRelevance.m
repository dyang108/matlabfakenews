function table = getRelevance(table)
    bodyMap = table.bodyCounts;
    bodyWords = table.totalWords;
    headlines = table.headWords;
    headssize = size(headlines);
    for i = 1:headssize(1)
        [cumSumScore , wordsScore] = getScores(headlines{i}, bodyMap{i,1}, bodyWords);
        table.relevance(i) = cumSumScore;
        table.headlineWordsInArticle(i) = wordsScore;
    end
end
