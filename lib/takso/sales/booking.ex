defmodule Takso.Sales.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :pickup_address, :string
    field :dropoff_address, :string
    timestamps()
  end

  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:pickup_address, :dropoff_address])
    |> validate_required([:pickup_address, :dropoff_address])
    |> validate_same_place(:dropoff_address)
  end

  def validate_same_place(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, dropoff_address ->
      {_, pickup_address} = fetch_field(changeset, :pickup_address)

      if pickup_address == dropoff_address do
        [
          {field,
           options[:message] || "Dropoff address cannot be the same place as pickup address"}
        ]
      else
        []
      end
    end)
  end
end
