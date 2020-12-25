# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FreshEquities.Repo.insert!(%FreshEquities.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

FreshEquities.CapitalRaises.create_offer(%{
  code: "ASX:CBA",
  name: "Commonwealth Bank",
  issuing: 10_000_000,
  price: 1.0000,
  halt_price: 1.2000,
  options_expiration: 24,
  options_listing_condition: "listed",
  options_ratio_numerator: 1,
  options_ratio_denominator: 1,
  options_strike_price: 1.5000,
  bidding_open: DateTime.utc_now(),
  bidding_closed: DateTime.add(DateTime.utc_now(), 172_800)
})

FreshEquities.CapitalRaises.create_offer(%{
  code: "ASX:NAB",
  name: "National Australia Bank",
  issuing: 15_000_000,
  price: 1.500,
  halt_price: 1.7000,
  bidding_open: DateTime.utc_now(),
  bidding_closed: DateTime.add(DateTime.utc_now(), 172_800)
})

FreshEquities.CapitalRaises.create_offer(%{
  code: "ASX:WBC",
  name: "Westpac Banking Corp",
  issuing: 10_000_000,
  price: 19.0000,
  halt_price: 19.9300,
  options_expiration: 24,
  options_listing_condition: "listed",
  options_ratio_numerator: 1,
  options_ratio_denominator: 3,
  options_strike_price: 20.5000,
  bidding_open: DateTime.utc_now(),
  bidding_closed: DateTime.add(DateTime.utc_now(), 172_800)
})
