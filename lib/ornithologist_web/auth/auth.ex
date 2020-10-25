defmodule Ornithologist.Auth do
  alias Ornithologist.Accounts

  def sign_in(email, password) do
    user = Accounts.get_user_by_email(email)
    cond do
      user ->
        Argon2.check_pass(user, password)
      true ->
        {:error, :unauthorized}
    end
  end
end
