class CreateRequestDeadlines < ActiveRecord::Migration[5.2]
  def change
    create_table :request_deadlines do |t|
      t.datetime :deadline

      t.timestamps
    end
  end
end
