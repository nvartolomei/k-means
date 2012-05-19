% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
	centroids = [];

    NP = length(points(:,1));

    p_min = min(points);
    p_max = max(points);
    p_diff = p_max .- p_min;

    %%
    % better aproach at assigning centroids
    %
    % analizing performance of alogrithm we can define some special cases when
    % it performs very bad, one of the case is when number of clusters is
    % close to number of points. in this case it's useless to generate random
    % centroids
    %
    % i thrown a dice four time to get this %)
    % actually this value performs good enough to let it there
    if (NP/NC < 1.2)
        centroids(1:NC, :) = points(1:NC, :);
    else
        centroids = rand(NC, 3);
        for c = 1:NC
            centroids(c, :) = centroids(c, :).* p_diff;
            centroids(c, :) = centroids(c, :) + p_min;
        end
    end

    centroids_diff = 1.0;
    while centroids_diff  > 0.0
        new_centroids = zeros(NC, 3);
        clusterpoints = zeros(NC, 1);
        relations = [];

        % check every point and assign to cluster
        for p = 1:NP
            % distance to point from each centroid
            d = distance(repmat(points(p,:), NC , 1), centroids);

            % minimum distance and index of centroid it was calculated for
            [d, index] = min(d);

            relations = [ relations; index ];

            new_centroids(relations(p), :) += points(p, :);
        end

        % recalculate new positions
        for c = 1:NC
            clusterpoints(c, 1) = sum(relations == c);

            % in case we have wrong point for centroid try to get a better one
            if (clusterpoints(c, 1) != 0)
                new_centroids(c, :) = new_centroids(c, :) / clusterpoints(c, 1);
            else
                new_centroids(c, :) = (rand(1, 3) .* p_diff) + p_min;
            end
        end

        centroids_diff = norm(new_centroids - centroids);
        centroids = new_centroids;
    end
end
