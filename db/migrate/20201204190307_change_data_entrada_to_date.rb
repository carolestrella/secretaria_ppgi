class ChangeDataEntradaToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :tickets, :data_entrada, :date
    change_column :tickets, :data_saida, :date
  end
end
