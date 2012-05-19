function view_cost_vs_nc(file_points)
	% compute cost for NC = [1..10] and plot

    % open file
    load(file_points);

    costs = [];

    % compute cost for NC = [1..10]
    for NC = 1:10
        centroids = clustering_pc(points, NC);
        cost = compute_cost_pc(points, centroids);

        costs = [costs cost];
    end

    % plot
    clf;
    plot(1:10, costs);
    ylabel("Cost");
    xlabel("Cluster count");
end

