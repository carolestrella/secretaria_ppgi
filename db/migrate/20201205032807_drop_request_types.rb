class DropRequestTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :request_types
  end
end
