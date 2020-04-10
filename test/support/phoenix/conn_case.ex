defmodule PowAssent.Test.Phoenix.ConnCase do
  @moduledoc false
  use ExUnit.CaseTemplate
  alias Phoenix.ConnTest
  alias PowAssent.Test.Phoenix.{Endpoint, Router}

  using do
    quote do
      use ConnTest

      alias Router.Helpers, as: Routes

      @endpoint Endpoint
    end
  end

  setup do
    conn = ConnTest.build_conn()
    opts = Plug.Session.init(store: :cookie, key: "_binaryid_key", signing_salt: "secret")

    conn =
      conn
      |> Plug.Session.call(opts)
      |> Plug.Conn.fetch_session()

    {:ok, conn: conn}
  end
end
