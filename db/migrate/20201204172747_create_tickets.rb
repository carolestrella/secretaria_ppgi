class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.datetime :data_entrada
      t.datetime :data_saida

      t.timestamps
    end
  end
end
