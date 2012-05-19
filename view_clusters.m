% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
    % graphical representation coded here

    NP = length(points(:,1));
    NC = length(centroids(:,1));
    assignment = [];

    % recalculate points assignments and use them as colors
    % check every point and assign to cluster
    for p = 1:NP
        % distance to point from each centroid
        d = distance(repmat(points(p,:), NC , 1), centroids);

        % minimum distance and index of centroid it was calculated for
        [d, index] = min(d);

        assignment = [ assignment; index ];
    end
    
    clf;
    scatter3(points(:, 1), points(:, 2), points(:, 3), [], assignment);
end
