defmodule FreshEquitiesWeb.PageView do
  use FreshEquitiesWeb, :view

  require Logger

  alias FreshEquities.CapitalRaises.Offer

  def display_options(%Offer{
        options_expiration: oe,
        options_listing_condition: olc,
        options_ratio_numerator: orn,
        options_ratio_denominator: ord,
        options_strike_price: osp
      })
      when not is_nil(osp) do
    "+ #{orn}:#{ord} #{olc} options (#{Number.Currency.number_to_currency(osp, precision: 4)}, #{
      oe
    } month expiry)"
  end

  def display_options(_) do
    ""
  end

  def discount(%Offer{price: price, halt_price: halt_price}) do
    val = (halt_price - price) / price * 100
    Number.Percentage.number_to_percentage(val, precision: 2)
  end

  def last_close_price(%Offer{halt_price: halt_price}) do
    Number.Currency.number_to_currency(halt_price, precision: 4)
  end

  def offer_price(%Offer{price: price}) do
    Number.Currency.number_to_currency(price, precision: 4)
  end

  def raising(%Offer{price: price, issuing: issuing}) do
    val = Number.Human.number_to_human(price * issuing)
    "$" <> val
  end

  def time_left(%Offer{bidding_closed: bidding_closed}) do
    remaining = Timex.diff(bidding_closed, Timex.now(), :hours)

    cond do
      remaining > 0 ->
        "Closes in #{remaining} hours"

      remaining = 0 ->
        "Closes in less than 1 hour"

      remaining < 0 ->
        "Bidding has closed"
    end
  end
end
