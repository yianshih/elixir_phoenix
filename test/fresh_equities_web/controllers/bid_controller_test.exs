defmodule FreshEquitiesWeb.BidControllerTest do
  use FreshEquitiesWeb.ConnCase

  alias FreshEquities.CapitalRaises

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:bid) do
    {:ok, bid} = CapitalRaises.create_bid(@create_attrs)
    bid
  end

  describe "new bid" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bid_path(conn, :new))
      assert html_response(conn, 200) =~ "Bid for allocation"
    end
  end

  describe "create bid" do
    test "redirects to bid confirmed when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bid_path(conn, :create), bid: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bid_path(conn, :show, id)

      conn = get(conn, Routes.bid_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Bid Confirmation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bid_path(conn, :create), bid: @invalid_attrs)
      assert html_response(conn, 200) =~ "Bid for allocation"
    end
  end

  defp create_bid(_) do
    bid = fixture(:bid)
    %{bid: bid}
  end
end
