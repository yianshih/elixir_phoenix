defmodule FreshEquitiesWeb.BidController do
  use FreshEquitiesWeb, :controller

  alias FreshEquities.CapitalRaises
  alias FreshEquities.CapitalRaises.Offer
  alias FreshEquities.CapitalRaises.Bid
  alias FreshEquities.Repo

  def new(conn, %{"offer_id" => offer_id}) do
    changeset = CapitalRaises.change_bid(%Bid{})
    offer = CapitalRaises.get_offer!(offer_id)
    render(conn, "new.html", changeset: changeset, offer_id: offer_id, offer: offer, exceed: false)
  end

  def create(conn, %{"offer_id" => offer_id, "bid" => bid_params}) do
    
    offer = CapitalRaises.get_offer!(offer_id)
    new_params = Map.merge(bid_params,%{"offer_id" => offer_id, "share_value" => offer.price})
    changeset = CapitalRaises.change_bid(%Bid{},new_params)

    if changeset.valid? do 

      # get amount from form with default value 0
      amount = Map.get(bid_params,"amount","0")

      # Calculate new raise
      newRaise = floor(offer.issuing - (offer.price*String.to_integer(amount)))

      # new offer to update
      newOffer = %{offer | issuing: newRaise}

      if newRaise < 0 do
        # if bid exceed raise, then return 
        render(conn, "new.html",changeset: changeset,offer_id: offer_id,offer: offer,exceed: true )
      else 
        case Repo.insert(changeset) do 
          {:ok, res} -> 
            offer
            |> Offer.changeset(%{issuing: newRaise})
            |> Repo.update()
            render(conn, "show.html",res: res, offer: offer)
          {:error, changeset} ->
            render(conn, "new.html",changeset: changeset,offer_id: offer_id,offer: offer,exceed: false)
        end
      end
    else
      # changeset is invalide, return error message
      case Repo.insert(changeset) do 
        {:ok, res} -> 
          render(conn, "show.html",res: res, offer: offer)
        {:error, changeset} ->
          render(conn, "new.html",changeset: changeset,offer_id: offer_id,offer: offer,exceed: false)
        end
    end

    # TODO: Create action for a new bid submitted from the bid form
  end

  def show(conn, %{"offer_id" => offer_id, "id" => id}) do
    bid = CapitalRaises.Bid.get_bid!(id)
    offer = CapitalRaises.get_offer!(offer_id)
    render(conn, "show.html",bid: bid )
    # TODO: Receipt action for the bid
  end
end
