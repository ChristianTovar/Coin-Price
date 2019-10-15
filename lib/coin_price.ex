defmodule CoinPrice do
  @moduledoc """
  Documentation for CoinPrice.
  """

  def get_prices() do
    CoinDesk.get_all_currencies()
    |> Enum.map(fn product_id ->
      spawn(fn -> CoinDesk.print_price(product_id) end)
    end)
  end

  def get_number_of_currencies() do
    CoinDesk.amount_of_currencies()
  end
end
