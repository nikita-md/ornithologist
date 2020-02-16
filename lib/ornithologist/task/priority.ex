defmodule Ornithologist.Task.Priority do
  def map do
    %{
      minor: 0,
      major: 1,
      critical: 2
    }
  end

  def humanize(enum) do
    map() |> Enum.find(fn {_,v} -> v == enum end) |> elem(0)
  end

  def values, do: map() |> Map.values

  def keys, do: map() |> Map.keys
end
