defmodule HttpServer.RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias HttpServer.Router

  @content "<html><body>Hello World</body></html>"
  @mimetype "text/html"

  @opts Router.init([])

  test "returns welcome" do
    conn =
      :get
      |> conn("/", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "returns upload" do
    conn =
      :get
      |> conn("/upload?content=#{@content}&mimetype=#{@mimetype}")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 201
  end

  test "returns 404" do
    conn =
      :gen
      |> conn("/crash")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
  end
end