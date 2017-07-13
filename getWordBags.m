function t = getWordBags(data)
    bodies = data.articleBody;
    headlines = data.Headline;
    bsize = size(bodies);
    bodyBags = cell(bsize(1), 1);
    headWords = cell(bsize(1), 1);
    for i = 1:bsize(1)
        bodyBags{i} = getWordBag(bodies{i});
        headWords{i} = getImportantHeadline(headlines{i});
    end
    t = table(bodyBags, headWords, data.Stance);
end

function wordBag = getWordBag(articleBody)
    doc = tokenizedDocument(articleBody);
%     doc = normalizeWords(doc);
    wordBag = bagOfWords(doc);
    wordBag = removeWords(wordBag, stopWords);
end

function importantHeadline = getImportantHeadline(origHead)
    doc = tokenizedDocument(origHead);
    importantHeadline = removeWords(doc, stopWords);
end