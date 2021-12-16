defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.ExpirationEmail
  alias Inmana.Supplies.GetByExpiration

  def send do
    GetByExpiration.call()
    |> Enum.each(fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
