class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :request_type, foreign_key: true
      t.references :user, foreign_key: true
      t.string :documents

      t.timestamps
    end
  end
end
