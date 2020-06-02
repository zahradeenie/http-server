defmodule HttpServer.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: HttpServer.Router, options: [port: port()] }
    ]

    opts = [strategy: :one_for_one, name: HttpServer.Supervisor]

    Logger.info("Starting app...")

    Supervisor.start_link(children, opts)
  end

  defp port do
    Application.get_env(:http_server, :port, 8080)
  end
end
