defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "When user is special, returns a special message" do
      params = %{"name" => "Banana", "age" => "42"}

      result = Welcomer.welcome(params)
      expected = {:ok, "You are very special Banana"}

      assert result == expected
    end

    test "When the user is not special, return a message" do
      params = %{"name" => "Alexandre", "age" => "26"}

      result = Welcomer.welcome(params)
      expected = {:ok, "Welcome #{Map.get(params, "name")}"}

      assert result == expected
    end

    test "When the user is under age, return an error" do
      params = %{"name" => "Alexandre", "age" => "16"}

      result = Welcomer.welcome(params)
      expected = {:error, "You shall not pass"}

      assert result == expected
    end
  end
end
