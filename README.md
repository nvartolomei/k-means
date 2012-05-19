Point clustering. K-Means algorithm.
==============================

> In data mining, k-means clustering is a method of cluster analysis which aims
> to partition n observations into k clusters in which each observation belongs 
> to the cluster with the nearest mean. This results into a partitioning of the 
> data space into Voronoi cells.
>
> Source: [Wikipedia](http://en.wikipedia.org/wiki/K-means_clustering).

## The K-Means Algorithm Process

* The dataset is partitioned into K clusters and the data points are randomly 
  assigned to the clusters resulting in clusters that have roughly the same 
  number of data points.

* For each data point:
* * Calculate the distance from the data point to each cluster.
* * If the data point is closest to its own cluster, leave it where it is. 
    If the data point is not closest to its own cluster, move it into the closest
    cluster.

* Repeat the above step until a complete pass through all the data points 
  results in no data point moving from one cluster to another. 
  At this point the clusters are stable and the clustering process ends.

* The choice of initial partition can greatly affect the final clusters that 
  result, in terms of inter-cluster and intracluster distances and cohesion.

> ^ Quoted as is from [ios](http://www.improvedoutcomes.com/docs/WebSiteDocs/Clustering/K-Means_Clustering_Overview.htm).

^_^
