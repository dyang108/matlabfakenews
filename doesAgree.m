function agreesWithHeadline = doesAgree(headline, body, model)
    [relevance, headlineWordsInArticle] = getParams(headline, body);
end

function [relevance, headlineWordsInArticle] = getParams(headline, body)
    cumSum = 0;
    wordsInHeadline = 0;
    array = split(headline);
    hsize = size(array);
    hsize = hsize(2);
    for j = 1:hsize
        hKey = char(array(j));
        if (isKey(body.hKey))
            freq = body(hKey);
            cumSum = cumSum + freq;
            wordsInHeadline = wordsInHeadline + 1;
        end
        
    end
    relevance = cumSum/ bodyWor
end