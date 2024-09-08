defmodule Snap.Nodes do
  @moduledoc """
  Presents an interface for the Nodes Info API of ElasticSearch.

  If the Elasticsearch security features are enabled, you must have the monitor or manage cluster privilege to use this API.

  If you use the OpenSearch Security plugin, make sure you have the appropriate permissions: cluster:monitor/nodes/info.

  [ElasticSearch Nodes Info API](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-info.html)
  [OpenSearch Nodes Info API](https://opensearch.org/docs/latest/api-reference/nodes-apis/nodes-info/)
  """

  @doc """
  GET /_nodes
  """
  @spec info(module()) :: Cluster.result()
  @spec info(module(), Keyword.t()) :: Cluster.result()
  def info(cluster, filters \\ [], opts \\ []) do
    nodes = "/_nodes/" <> Keyword.get(filters, :nodes, "")
    metrics = Keyword.get(filters, :metrics, "")

    url = nodes <> metrics
    Snap.get(cluster, url, [], [], opts)
  end
end
