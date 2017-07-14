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

function [cumSumScore, wordsScore]  = getScores(headline, body, bodyWords)
    cumSum = 0;
    wordsInHeadline = 0;
    array = string(headline);
    hsize = size(array);
    hsize = hsize(2);
    for j = 1:hsize
        hKey = char(array(j));
        if (isKey(body,hKey))
            freq = body(hKey);
            cumSum = cumSum + freq;
            wordsInHeadline = wordsInHeadline + 1;
        end
    end
    cumSumScore = cumSum/bodyWords{1,1};
    wordsScore = wordsInHeadline/hsize;
end