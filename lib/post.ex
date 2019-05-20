defmodule Post do
  @derive [Poison.Encoder]

  defstruct [:id,
             :title,
             :url,
             :selftext,
             :created]

  def new(model) do
    %{"id" =>  id,
      "title" =>  title,
      "url" =>  url,
      "selftext" => selfteext,
      "created_utc" => created} = model
    %Post{id: id,
          title: title,
          url: url,
          selftext: selfteext,
          created: created}
  end
end
