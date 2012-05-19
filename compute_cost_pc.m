% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0;
	% compute clustering solution cost

    NP = length(points(:,1));
    NC = length(centroids(:,1));

    for p = 1:NP
        % distance to point from each centroid
        d = distance(repmat(points(p,:), NC , 1), centroids);
        % minimum distance and index of centroid it was calculated for
        [d, index] = min(d);

        cost += d;
    end
end
