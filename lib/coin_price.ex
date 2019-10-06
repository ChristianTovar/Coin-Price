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
end
