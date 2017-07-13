function t = getWordBags(data)
    bodies = data.articleBody;
    headlines = data.Headline;
    bsize = size(bodies);
    bodyCounts = cell(bsize(1), 1);
    headWords = cell(bsize(1), 1);
    totalWords = cell(bsize(1), 1);
    bodyBags = cell(bsize(1), 1);
    headBags = cell(bsize(1), 1);
    for i = 1:bsize(1)
        [wordCounts, numWords, bodyBag] = getWordBag(bodies{i});
        [importantHeadline, headBag] = getImportantHeadline(headlines{i});
        bodyBags{i} = bodyBag;
        bodyCounts{i} = wordCounts;
        totalWords{i} = numWords;
        headWords{i} = importantHeadline;
        headBags{i} = headBag;
    end
    stance = data.Stance;
    t = table(bodyCounts, headWords, totalWords, stance, bodyBags, headBags);
end

function [wordCounts, numWords, bodyBag] = getWordBag(articleBody)
    doc = tokenizedDocument(articleBody);
    bodyBag = bagOfWords(doc);
    bodyBag = removeWords(bodyBag, [stopWords,".","?","!",",",";",":"]);
    fullCounts = full(bodyBag.Counts);
    wordCounts = containers.Map(convertStringsToChars(bodyBag.Vocabulary), num2cell(fullCounts));
    numWords = bodyBag.NumWords;
end

function [importantHeadline, headBag] = getImportantHeadline(origHead)
    doc = tokenizedDocument(origHead);
    headBag = bagOfWords(doc);
    vocab = removeWords(doc, [stopWords,".","?","!",",",";",":"]);
    importantHeadline = vocab.Vocabulary;
end