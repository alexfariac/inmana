defmodule InmanaWeb.RestaurantControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "When all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Siri Cascudo", email: "siri@cascudo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant Created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com",
                 "id" => _id,
                 "name" => "Siri Cascudo"
               }
             } = response
    end

    test "When there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "siri@cascudo.com"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
