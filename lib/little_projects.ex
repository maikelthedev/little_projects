defmodule LittleProjects do
  @moduledoc """
  Documentation for `LittleProjects`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> LittleProjects.hello()
      :world

  """
  def hello do
    :world
  end

  def send_message(title, content) do
    message = %Pushover.Model.Message{
      title: title,
      data: content
    }

    Pushover.Api.Messages.send(message)
  end

  def send_message(title, content, :require_response) do
    message = %Pushover.Model.Message{
      title: title,
      priority: 2,
      expire: 600,
      retry: 30, #seconds

      data: content
    }

    Pushover.Api.Messages.send(message)
  end
end
