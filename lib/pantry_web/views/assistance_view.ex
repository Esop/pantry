defmodule PantryWeb.AssistanceView do
  use PantryWeb, :view

  def add_30_days do
    Date.add(Date.utc_today(), 30)
  end
end
