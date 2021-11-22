defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> String.capitalize()
    |> evaluate(age)
  end

  defp evaluate("Banana", 42) do
    {:ok, "You are very special Banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(_, _) do
    {:error, "You shall not pass"}
  end
end
