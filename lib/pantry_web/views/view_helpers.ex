defmodule PantryWeb.ViewHelpers do
  @moduledoc """
  Just a few view helpers
  """

  def params(list) do
    Enum.filter(list, fn {_, v} -> present?(v) end)
  end

  def present?(""), do: false
  def present?(nil), do: false
  def present?(_), do: true
end
