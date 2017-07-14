function agreesWithHeadline = doesAgree(headline, body, model, sents)
% this is the function that classifies between our four categories
    bodyDoc = tokenizedDocument(body);
    bodyDoc = normalizeWords(bodyDoc);
    bodyBag = bagOfWords(bodyDoc);
    bodyBag = removeWords(bodyBag, [stopWords,".","?","!",",",";",":"]);
    fullCounts = full(bodyBag.Counts);
    bodyCounts = containers.Map(convertStringsToChars(bodyBag.Vocabulary), num2cell(fullCounts));
    numWords = bodyBag.NumWords;

    headDoc = tokenizedDocument(headline);
    headDoc = normalizeWords(headDoc);
    headBag = bagOfWords(headDoc);
    headBag = removeWords(headBag, [stopWords,".","?","!",",",";",":"]);
    headWords = headBag.Vocabulary;
    headNum = headBag.NumWords;
    
    [relevance, headlineWordsInArticle] = getScores(headWords, bodyCounts, {numWords});
    testParams = table(relevance, headlineWordsInArticle);
    relevanceCell = predict(model, testParams);
    relevance = relevanceCell{1};
    if strcmp(relevance, 'unrelated')
        agreesWithHeadline = 'unrelated';
        return;
    end
    
    prepSentiments = table({bodyBag}, {headBag});
    prepSentiments.Properties.VariableNames = {'bodyBags', 'headBags'};
    sentiments = getSentiment(prepSentiments, sents);
    
    bodySent = sentiments.bodySent{1};
    bodySent = bodySent / numWords;
    headSent = sentiments.headSent{1} / headNum;
    diff = abs(bodySent - headSent);
    if sign(bodySent) ~= sign(headSent) && diff > 0.15
        agreesWithHeadline = 'disagree';
    elseif sign(bodySent) ~= sign(headSent) && diff <= 0.15
        agreesWithHeadline = 'discuss';
    elseif sign(bodySent) == sign(headSent) && diff < .15
        agreesWithHeadline = 'agree';
    elseif diff > .15
        agreesWithHeadline = 'disagree';
    else
        agreesWithHeadline = 'discuss';
    end
%     higher number means more difference in sentiment
%     agreesWithHeadline = (1 / (-(diff + 1) ^5)) + 1; %(atan(5 * (diff - 0.5)) / pi) + 0.5;
end