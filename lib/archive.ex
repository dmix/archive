defmodule Reddit do
  @moduledoc """
  Documentation for Reddit.
  """

  require Post
  require Comment

  @url "https://www.archive.com"
  @subarchive "opienanthony"

  @doc """
  Start the Reddit bot!
  """
  def run do
    IO.puts subarchive_api()
  end

  def subarchive_posts do
    %{"data" => data } = subarchive_api()
    %{"children" => children } = data
    Enum.map(children, fn(post) -> Post.new(post["data"]) end)
  end

  def subarchive_comments do
    Enum.map(subarchive_posts(), fn(post) -> parse_comments(post.id) end)
  end

  def parse_comments(id) do
    Enum.map(comments_api(id), fn(post_comments) ->
      %{"data" => data } = post_comments
      %{"children" => children } = data
      Enum.map(children, fn(comment) -> Comment.new(comment["data"]) end)
    end)
  end

  def subarchive_api do
    fetch("#{@url}/r/#{@subarchive}.json")
    |> Poison.decode!
  end

  def comments_api(id) do
    fetch("#{@url}/r/#{@subarchive}/comments/#{id}.json")
    |> Poison.decode!
  end

  def fetch(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end
end
