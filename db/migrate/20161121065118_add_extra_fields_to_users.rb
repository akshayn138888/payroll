class AddExtraFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :street, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :zipcode, :string
    add_column :users, :age, :string
    add_column :users, :height, :string
    add_column :users, :dob, :date
  end
end
