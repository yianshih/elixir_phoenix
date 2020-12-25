defmodule FreshEquitiesWeb.PageController do
  use FreshEquitiesWeb, :controller

  alias FreshEquities.CapitalRaises

  def index(conn, _params) do
    offers = CapitalRaises.list_offers()
    render(conn, "index.html", offers: offers)
  end
end
