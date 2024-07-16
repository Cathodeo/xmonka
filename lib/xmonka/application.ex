defmodule Xmonka.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Xmonka.Repo,
      # Start the Telemetry supervisor
      XmonkaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Xmonka.PubSub},
      # Start the Endpoint (http/https)
      XmonkaWeb.Endpoint,
      # Start a worker by calling: Xmonka.Worker.start_link(arg)
      # {Xmonka.Worker, arg}
      Supervisor.child_spec({Xmonka.Player, :player_1}, id: :player_1),
      Supervisor.child_spec({Xmonka.Player, :player_2}, id: :player_2)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Xmonka.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    XmonkaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
