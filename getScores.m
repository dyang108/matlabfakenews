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