class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :data_entrada
      t.date :data_saida

      t.timestamps
    end
  end
end
