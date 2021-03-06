defmodule CoinPrice do
  @moduledoc """
  Documentation for CoinPrice module.
  """

  def get_prices() do
    CoinDesk.get_all_currencies()
    |> Enum.map(fn product_id ->
      spawn(fn -> CoinDesk.print_price(product_id) end)
    end)
  end

  @doc """
  Get the numeber of currencies supported by the coindesk API.
  ## Examples
      iex> CoinPrice.get_number_of_currencies()
      167
  """
  def get_number_of_currencies, do: CoinDesk.amount_of_currencies()
end
