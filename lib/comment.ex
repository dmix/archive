defmodule Comment do
  @derive [Poison.Encoder]

  defstruct [:id,
             :body,
             :ups,
             :downs,
             :score,
             :author,
             :created]

  def new(model) do
    %{"id" =>  id,
      "ups" => ups,
      "downs" => downs,
      "score" => score,
      "author" =>  author,
      "body" => body,
      "created_utc" =>  created} = model
    %Comment{id: id,
             ups: ups,
             downs: downs,
             score: score,
             author: author,
             body: body,
             created: created}
  end
end
