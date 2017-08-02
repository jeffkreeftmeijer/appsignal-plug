defmodule AppsignalPlugExample do
  use Plug.Router
  use Appsignal.Instrumentation.Decorators

  plug :match
  plug :dispatch

  use Appsignal.Plug

  get "/" do
    slow()
    send_resp(conn, 200, "Welcome")
  end

  @decorate transaction_event()
  defp slow do
    :timer.sleep(1000)
  end

  use Appsignal.Plug
end
