function x = keyByWord(obj)
    x = containers.Map('char', 'char');
    s = size(obj);
    for i = 1:s(1)
        x(obj(i).word1) = obj(i).priorpolarity;
    end
end