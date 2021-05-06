defmodule OtpChallengeTest do
  use ExUnit.Case
  doctest OtpChallenge

  test "greets the world" do
    assert OtpChallenge.hello() == :world
  end
end
