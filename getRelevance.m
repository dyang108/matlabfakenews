function table = getRelevance(table)
    bodyMap = table.bodyCounts;
    bodyWords = table.totalWords;
    headlines = table.headWords;
    headssize = size(headlines);
%     display( headlines);
    for i = 1:headssize(1)
        cumSum = 0;
        wordsInHeadline = 0;
        array = string(headlines{i});
        hsize = size(array);
        hsize = hsize(2);
        body = bodyMap{i,1};
        for j = 1:hsize
            hKey = char(array(j));
            if (isKey(body,hKey))
                freq = body(hKey);
                cumSum = cumSum + body(hKey);
                wordsInHeadline = wordsInHeadline + 1;
            end
        end
        cumSumScore = cumSum/bodyWords{1,1};
        wordsScore = wordsInHeadline/hsize;
        table.relevance(i) = cumSumScore;
        table.headlineWordsInArticle(i) = wordsScore;
    end
end