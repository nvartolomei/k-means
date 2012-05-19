% calculate distance betweet two points in space
function d = distance(a, b)
    d = ((sum(((a - b).^2)')).^(1/2))';
end
