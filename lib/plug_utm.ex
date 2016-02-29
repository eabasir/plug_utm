defmodule PlugUtm do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _options) do
    conn
    |> fetch_cookies
    |> fetch_query_params
    |> store_utm_params
  end

  defp store_utm_params(conn) do
    conn.query_params
    |> Map.keys
    |> Enum.filter(&starting_with_utm/1)
    |> Enum.reduce(conn, &key_to_cookie/2)
  end

  defp key_to_cookie(key, conn) do
    "utm_" <> type = key
    name = "utm.#{type}"
    value = conn.query_params[key]

    put_resp_cookie(conn, name, value)
  end

  defp starting_with_utm(param_name) do
    case param_name do
      "utm_" <> _ -> true
      _ -> false
    end
  end
end
