defmodule HttpServer.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: HttpServer.Router, options: [port: 8080] }
    ]

    opts = [strategy: :one_for_one, name: HttpServer.Supervisor]

    Logger.info("Starting app...")

    Supervisor.start_link(children, opts)
  end
end
