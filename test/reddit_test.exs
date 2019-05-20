defmodule RedditTest do
  use ExUnit.Case
  doctest Reddit

  test "subarchive API response" do
    assert Reddit.subarchive_api["kind"]=~ "Listing"
  end

  # test "subarchive posts API" do
  #   assert Reddit.subarchive_posts == :me
  # end

  test "subarchive post comments API" do
    assert Reddit.subarchive_comments == :me
  end
end
