defmodule FreshEquities.Repo.Migrations.CreateOffers do
  use Ecto.Migration

  def change do
    create table(:offers) do
      add :code, :string
      add :name, :string
      add :issuing, :integer
      add :price, :float
      add :halt_price, :float
      add :options_expiration, :integer
      add :options_listing_condition, :string
      add :options_ratio_numerator, :integer, default: 1
      add :options_ratio_denominator, :integer, default: 1
      add :options_strike_price, :float
      add :bidding_open, :utc_datetime
      add :bidding_closed, :utc_datetime

      timestamps()
    end
  end

  
end
