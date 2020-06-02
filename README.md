# HttpServer

The purpose of creating this small application was to find out how a HTTP server is set up in Elixir. I followed the [Elixir School](https://elixirschool.com/en/lessons/specifics/plug/) tutorial on Plugs (based off the official Plug documentation) and have continued reading other sources of info on this.

## What is Plug

Plug defines the way you create your applications and provides tools to write apps that are understood by web servers.

Plug uses the `plug_cowboy` adapter which runs on Erlang's Cowboy HTTP server - this simply means we can build functions to send, receive, handle and respond to requests.
