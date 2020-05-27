defmodule AppsignalPlugExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: AppsignalPlugExample, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: AppsignalPlugExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
