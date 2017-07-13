function table = getParameters(tsize)
    data = getdata();
    if (tsize == 'end')
        tsize = size(data);
        tsize = tsize(1);
    end
    table = getWordBags(data(1:tsize, :));
    table.relevance = zeros(tsize, 1);
    table.headlineWordsInArticle = zeros(tsize, 1);
    table = getRelevance(table);
    table.related = num2cell(string(table{:,4}) ~= 'unrelated');
    for i = 1:tsize
        if (table.related{i})
            table.related{i} = 'related';
        else
            table.related{i} = 'unrelated';
        end
    end
end