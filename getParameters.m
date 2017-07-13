function table = getParameters(tsize)
    data = getdata();
    table = getWordBags(data(1:tsize, :));
    table.relevance = zeros(tsize, 1);
    table.headlineWordsInArticle = zeros(tsize, 1);
    table = getRelevance(table);
    table.related = num2cell(string(table{:,4}) ~= 'unrelated');
end