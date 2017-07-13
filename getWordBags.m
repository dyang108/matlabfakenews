function t = getWordBags(data)
    bodies = data.articleBody;
    headlines = data.Headline;
    bsize = size(bodies);
    bodyCounts = cell(bsize(1), 1);
    headWords = cell(bsize(1), 1);
    for i = 1:bsize(1)
        bodyCounts{i} = getWordBag(bodies{i});
        headWords{i} = getImportantHeadline(headlines{i});
    end
    t = table(bodyCounts, headWords, data.Stance);
end

function wordCounts = getWordBag(articleBody)
    doc = tokenizedDocument(articleBody);
    wordBag = bagOfWords(doc);
    wordBag = removeWords(wordBag, [stopWords,".","?","!",",",";",":"]);
    fullCounts = full(wordBag.Counts);
    wordCounts = [fullCounts; wordBag.Vocabulary];
end

function importantHeadline = getImportantHeadline(origHead)
    doc = tokenizedDocument(origHead);
    vocab = removeWords(doc, [stopWords,".","?","!",",",";",":"]);
    importantHeadline = vocab.Vocabulary;
end