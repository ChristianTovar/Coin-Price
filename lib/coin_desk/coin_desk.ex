defmodule CoinDesk do
  @coindesk_url "https://api.coindesk.com/v1/bpi/currentprice"
  @all_currencies_url "https://api.coindesk.com/v1/bpi/supported-currencies.json"

  def get_all_currencies() do
    HTTPoison.get!(@all_currencies_url, [], timeout: 50_000, recv_timeout: 50_000).body
    |> Jason.decode!()
    |> Enum.map(fn %{"country" => _, "currency" => currency} -> currency end)
  end

  def get_price(currency) do
    url = "#{@coindesk_url}/#{currency}.json"

    %{"bpi" => %{^currency => details}} =
      HTTPoison.get!(url, [], timeout: 50_000, recv_timeout: 50_000).body
      |> Jason.decode!()

    details["rate"]
  end

  def amount_of_currencies do
    get_all_currencies() |> length()
  end

  def print_price(product_id) do
    :timer.sleep(1000)
    start = System.monotonic_time(:millisecond)
    price = get_price(product_id)
    stop = System.monotonic_time(:millisecond)

    time = (stop - start) / 1000
    IO.puts("#{product_id}: #{price}\ttime: #{time}s")
  end
end
