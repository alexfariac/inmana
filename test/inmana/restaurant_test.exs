defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{name: "Siri cascudo", email: "siri@cascudo.com"}, valid?: true} =
               response
    end

    test "when there are invalida params, returns an invalid changeset" do
      params = %{name: "S", email: ""}

      response = Restaurant.changeset(params)

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
