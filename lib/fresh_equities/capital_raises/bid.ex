defmodule FreshEquities.CapitalRaises.Bid do
  use Ecto.Schema
  import Ecto.Changeset
  alias FreshEquities.CapitalRaises.Offer

  # TODO: implement bid schema and changeset

  @bid_fields [
    :user_name,
    :user_email,
    :user_phone_number,
    :offer_id, 
    :amount, 
  ]

  schema "bids" do
    field :user_name, :string
    field :user_email, :string
    field :user_phone_number, :string
    field :offer_id, :string
    field :amount, :integer
    field :share_value, :float
    timestamps()
  end

  

  @doc false
  def changeset(bid, attrs) do
    bid
    |> cast(attrs, [:share_value, :offer_id, :user_name, :user_email, :user_phone_number, :amount])
    |> validate_required([:user_name, :user_email, :user_phone_number, :amount])
    |> validate_format(:user_email, ~r/@/)
    |> unique_constraint(:user_email)
    |> validate_length(:user_name, min: 2, max: 20)
  end
end
