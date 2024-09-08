defmodule Snap.Nodes.Stats do
  @moduledoc """
  Presents an interface for the Nodes Stats API of ElasticSearch.

  [ElasticSearch Nodes Stats API](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-stats.html)
  [OpenSearch Nodes Stats API](https://opensearch.org/docs/latest/api-reference/nodes-apis/nodes-stats/)
  """

  @doc """
  GET /_nodes/stats
  """
  @spec stats(module()) :: Cluster.result()
  @spec stats(module(), Keyword.t()) :: Cluster.result()
  def stats(cluster, filters \\ [], opts \\ []) do
    nodes = "/_nodes/" <> Keyword.get(filters, :nodes, "")
    stats = "/stats/" <> Keyword.get(filters, :stats, "")
    index_metrics = Keyword.get(filters, :index_metrics, "")

    url = nodes <> stats <> index_metrics
    Snap.get(cluster, url, [], [], opts)
  end

  defp parse_nodes(nodes: nodes) when is_binary(nodes), do: "/_nodes/#{nodes}/"

  defp parse_nodes(_filters), do: "/_nodes/"

  defp parse_stats(stats: stats) when is_binary(stats), do: "stats/#{stats}/"

  defp parse_stats(_filters), do: "stats/"

  defp parse_index_metrics(index_metrics: index_metrics) when is_binary(index_metrics),
    do: index_metrics

  defp parse_index_metrics(_filters), do: nil
end
