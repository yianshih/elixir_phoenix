defmodule FreshEquities.CapitalRaises.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  @offer_fields [
    :code,
    :name,
    :issuing,
    :price,
    :halt_price,
    :options_expiration,
    :options_listing_condition,
    :options_ratio_numerator,
    :options_ratio_denominator,
    :options_strike_price,
    :bidding_open,
    :bidding_closed
  ]

  schema "offers" do
    field :code, :string
    field :name, :string
    field :issuing, :integer
    field :price, :float
    field :halt_price, :float
    field :options_expiration, :integer
    field :options_listing_condition, :string
    field :options_ratio_numerator, :integer, default: 1
    field :options_ratio_denominator, :integer, default: 1
    field :options_strike_price, :float
    field :bidding_open, :utc_datetime
    field :bidding_closed, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, @offer_fields)
    |> validate_required([])
  end
end
