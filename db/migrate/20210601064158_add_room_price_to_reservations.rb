class AddRoomPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_price, :integer
  end
end
