defmodule FreshEquities.Repo.Migrations.CreateBids do
  use Ecto.Migration

  def change do
    create table(:bids) do
      add :user_name, :string
      add :user_email, :string
      add :user_phone_number, :string
      add :offer_id, :string
      add :amount, :integer
      add :share_value, :float

      timestamps()
    end
  end
end
