defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Takso.Sales.{Taxi, Booking}
  alias Takso.Repo

  def create(conn, _params) do
    query = from t in Taxi, where: t.status == "available", select: t
    available_taxis = Repo.all(query)

    if length(available_taxis) > 0 do
      conn
      |> put_flash(:info, "Your taxi will arrive in 5 minutes")
      |> redirect(to: Routes.booking_path(conn, :new))
    else
      conn
      |> put_flash(:info, "At present, there is no taxi available!")
      |> redirect(to: Routes.booking_path(conn, :new))
    end
  end

  def new(conn, _params) do
    changeset = Booking.changeset(%Booking{}, %{})
    render(conn, "new.html", changeset: changeset)
  end
end
