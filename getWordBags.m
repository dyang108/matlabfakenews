function t = getWordBags(data)
    bodies = data.articleBody;
    headlines = data.Headline;
    bsize = size(bodies);
    bodyCounts = cell(bsize(1), 1);
    headWords = cell(bsize(1), 1);
    totalWords = cell(bsize(1), 1);
    for i = 1:bsize(1)
        [wordCounts, numWords] = getWordBag(bodies{i});
        bodyCounts{i} = wordCounts;
        totalWords{i} = numWords;
        headWords{i} = getImportantHeadline(headlines{i});
    end
    t = table(bodyCounts, headWords, totalWords, data.Stance);
end

function [wordCounts, numWords] = getWordBag(articleBody)
    doc = tokenizedDocument(articleBody);
    wordBag = bagOfWords(doc);
    wordBag = removeWords(wordBag, [stopWords,".","?","!",",",";",":"]);
    fullCounts = full(wordBag.Counts);
    wordCounts = containers.Map(convertStringsToChars(wordBag.Vocabulary), num2cell(fullCounts));
    numWords = wordBag.NumWords;
end

function importantHeadline = getImportantHeadline(origHead)
    doc = tokenizedDocument(origHead);
    vocab = removeWords(doc, [stopWords,".","?","!",",",";",":"]);
    importantHeadline = vocab.Vocabulary;
end