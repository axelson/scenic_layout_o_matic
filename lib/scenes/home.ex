defmodule LayoutOMatic.Scene.Home do
  use Scenic.Scene

  alias Scenic.Graph
  alias Scenic.Layouts.Layout
  alias Scenic.Layouts.Layout.Grid

  import Scenic.Primitives

  @viewport :layout_o_matic
            |> Application.get_env(:viewport)
            |> Map.get(:size)

  @grid %Grid{percent_of_columns: [25, 25, 50], max_xy: @viewport, grid_ids: [:left, :center, :right], starting_xy: {0, 0}}

  @graph Graph.build()
         |> add_specs_to_graph(Layout.grid(@grid),
           id: :root_grid
         )

  def init(_, opts) do
    {:ok, opts, push: @graph}
  end
end
