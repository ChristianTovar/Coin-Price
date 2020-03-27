defmodule CoinPriceTest do
  use ExUnit.Case
  doctest CoinPrice

  test "amount of currencies" do
    assert CoinPrice.get_number_of_currencies() == 167
  end
end
