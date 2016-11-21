class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.integer :user_id
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps null: false
    end
  end
end
