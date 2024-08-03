defmodule Snap.Nodes do
  @moduledoc """
  Presents an interface for the Nodes API of a `Snap.Cluster`.
  
  [ElasticSearch Nodes API](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-stats.html)
  [OpenSearch Nodes API](https://opensearch.org/docs/2.15/api-reference/nodes-apis/index/)
  """
  
  @doc """
  GET /_nodes/stats
  """
  def stats(cluster, opts \\ []) do    
    Snap.get(cluster, "/_nodes/stats", [], [], opts)
  end
  
  @doc """
  GET /_nodes/<node_id>/stats
  """
  def node_stats(cluster, node_id, opts \\ []) do    
    Snap.get(cluster, "/_nodes/#{node_id}/stats", [], [], opts)
  end
  
  @doc """
  GET /_nodes/stats/<metric>
  """
  def metrics(cluster, metric, opts \\ []) do    
    Snap.get(cluster, "/_nodes/stats/#{metric}", [], [], opts)
  end
  
  @doc """
  GET /_nodes/<node_id>/stats/<metric>
  """
  def node_metrics(cluster, node_id, metric, opts \\ []) do    
    Snap.get(cluster, "/_nodes/#{node_id}/stats/#{metric}", [], [], opts)
  end
  
  @doc """
  GET /_nodes/stats/<metric>/<index_metric>  
  """
  def index_metrics(cluster, metric, index_metric, opts \\ []) do    
    Snap.get(cluster, "/_nodes/stats/#{metric}/#{index_metric}", [], [], opts)
  end
  
  @doc """
  GET /_nodes/<node_id>/stats/<metric>/<index_metric>
  """
  def node_index_metrics(cluster, node_id, metric, index_metric, opts \\ []) do    
    Snap.get(cluster, "/_nodes/#{node_id}/stats/#{metric}/#{index_metric}", [], [], opts)
  end
end