defmodule FreshEquitiesWeb.Router do
  use FreshEquitiesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FreshEquitiesWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/offers", OfferController, only: [] do
      resources "/bids", BidController, only: [:create, :new, :show]
    end

    post "/bids", BidController, :create

  end

  # Other scopes may use custom stacks.
  # scope "/api", FreshEquitiesWeb do
  #   pipe_through :api
  # end
end
