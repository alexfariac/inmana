defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  describe "render/2" do
    test "Renders create.json" do
      params = %{name: "Siri Cascudo", email: "siri@cascudo.com"}

      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant Created!",
               restaurant: %Restaurant{
                 email: "siri@cascudo.com",
                 id: _id,
                 name: "Siri Cascudo"
               }
             } = response
    end
  end
end