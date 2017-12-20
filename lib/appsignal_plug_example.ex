defmodule AppsignalPlugExample.Repo do
  use Ecto.Repo,
    otp_app: :appsignal_plug_example,
    adapter: Sqlite.Ecto2
end

defmodule AppsignalPlugExample.User do
  use Ecto.Schema

  schema "users" do
    field :email
  end
end

defmodule AppsignalPlugExample do
  use Plug.Router
  use Appsignal.Instrumentation.Decorators

  plug :match
  plug :dispatch

  use Appsignal.Plug

  get "/" do
    slow()
    AppsignalPlugExample.Repo.all(AppsignalPlugExample.User)
    send_resp(conn, 200, "Welcome")
  end

  @decorate transaction_event()
  defp slow do
    :timer.sleep(1000)
  end
end
