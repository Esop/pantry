defmodule PantryWeb.ClientView do
  use PantryWeb, :view

  def show_sort_info(nil), do: show_sort_info(:inserted_at)
  def show_sort_info(:inserted_at), do: "Sort: Oldest"
  def show_sort_info(:first_name), do: "Sort: First name"
  def show_sort_info(:last_name), do: "Sort: Last name"
  def show_sort_info(_param), do: nil

end
