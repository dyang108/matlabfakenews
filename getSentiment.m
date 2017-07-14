function sentiments = getSentiment(wordBags, sents)
    s = size(wordBags);
    bodySent = cell(s(1), 1);
    headSent = cell(s(1), 1);
    for j = 1:s(1)
        bodySent{j} = sentScore(wordBags(j, :).bodyBags{1}, sents);
        headSent{j} = sentScore(wordBags(j, :).headBags{1}, sents);
    end
    sentiments = table(bodySent, headSent);
end

function sentimentScore = sentScore(wordBag, sents)
    vocab = wordBag.Vocabulary;
    counts = wordBag.Counts;
%     display(vocab);
    s = size(vocab);
    sentimentScore = 0;
    for i = 1:s(2)
        hKey = lower(char(vocab(i)));
        if (isKey(sents, hKey))
            if (strcmp(sents(hKey), 'positive'))
                sentimentScore = sentimentScore + counts(i);
%                 display(hKey);
            elseif (strcmp(sents(hKey), 'negative'))
                sentimentScore = sentimentScore - counts(i);
%                 display(hKey);
            end
        end
    end
%     if (sentimentScore > 1 || sentimentScore < -1)
%         display('hello')
%     end
end