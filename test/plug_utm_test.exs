defmodule PlugUtmTest do
  use ExUnit.Case, async: true
  use Plug.Test

  doctest PlugUtm

  # Demo plug with a simple index action
  defmodule DemoPlug do
    use Plug.Builder

    plug PlugUtm

    plug :index
    defp index(conn, _opts), do: conn |> send_resp(200, "OK")
  end

  test "utm_source given" do
    conn = conn(:get, "/?utm_source=test")
    |> DemoPlug.call([])

    assert conn.status == 200
    assert conn.cookies["utm.source"] == "test"
  end
end
