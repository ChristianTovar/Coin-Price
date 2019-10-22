defmodule CoinPriceTest do
  use ExUnit.Case
  doctest CoinPrice

  test "amount of currencies" do
    amount = CoinPrice.get_number_of_currencies()
    assert amount == 167
  end
end
