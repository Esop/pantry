defmodule Pantry.Utils do
  @moduledoc """
    Assorted utility functions
  """

  def parse_search(nil), do: nil
  def parse_search(""), do: nil
  def parse_search(search), do: String.trim(search)

  def safe_to_atom(binary, allowed) do
    if binary in allowed, do: String.to_atom(binary)
  end

end
