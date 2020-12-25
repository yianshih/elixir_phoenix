defmodule FreshEquities.CapitalRaisesTest do
  use FreshEquities.DataCase

  alias FreshEquities.CapitalRaises

  describe "bids" do
    alias FreshEquities.CapitalRaises.Bid

    @valid_attrs %{dollar_amount: 42}
    @update_attrs %{dollar_amount: 43}
    @invalid_attrs %{dollar_amount: nil}

    def bid_fixture(attrs \\ %{}) do
      {:ok, bid} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CapitalRaises.create_bid()

      bid
    end

    test "list_bids/0 returns all bids" do
      bid = bid_fixture()
      assert CapitalRaises.list_bids() == [bid]
    end

    test "get_bid!/1 returns the bid with given id" do
      bid = bid_fixture()
      assert CapitalRaises.get_bid!(bid.id) == bid
    end

    test "create_bid/1 with valid data creates a bid" do
      assert {:ok, %Bid{} = bid} = CapitalRaises.create_bid(@valid_attrs)
      assert bid.dollar_amount == 42
    end

    test "create_bid/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CapitalRaises.create_bid(@invalid_attrs)
    end

    test "update_bid/2 with valid data updates the bid" do
      bid = bid_fixture()
      assert {:ok, %Bid{} = bid} = CapitalRaises.update_bid(bid, @update_attrs)
      assert bid.dollar_amount == 43
    end

    test "update_bid/2 with invalid data returns error changeset" do
      bid = bid_fixture()
      assert {:error, %Ecto.Changeset{}} = CapitalRaises.update_bid(bid, @invalid_attrs)
      assert bid == CapitalRaises.get_bid!(bid.id)
    end

    test "delete_bid/1 deletes the bid" do
      bid = bid_fixture()
      assert {:ok, %Bid{}} = CapitalRaises.delete_bid(bid)
      assert_raise Ecto.NoResultsError, fn -> CapitalRaises.get_bid!(bid.id) end
    end

    test "change_bid/1 returns a bid changeset" do
      bid = bid_fixture()
      assert %Ecto.Changeset{} = CapitalRaises.change_bid(bid)
    end
  end

  describe "offers" do
    alias FreshEquities.CapitalRaises.Offer

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def offer_fixture(attrs \\ %{}) do
      {:ok, offer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CapitalRaises.create_offer()

      offer
    end

    test "list_offers/0 returns all offers" do
      offer = offer_fixture()
      assert CapitalRaises.list_offers() == [offer]
    end
  end
end
