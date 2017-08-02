defmodule AppsignalPlugExample do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    slow()
    send_resp(conn, 200, "Welcome")
  end

  defp slow do
    :timer.sleep(1000)
  end
end
