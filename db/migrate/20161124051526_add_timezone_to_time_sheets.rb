class AddTimezoneToTimeSheets < ActiveRecord::Migration
  def change
    add_column :time_sheets, :timezone, :string
  end
end
