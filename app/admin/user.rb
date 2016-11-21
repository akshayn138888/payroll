ActiveAdmin.register User do

  form :partial => "form"
  filter :email
  filter :password

  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :password
      f.input :age, as: :select, collection: (18..60)
      f.input :height
      f.input :dob
      f.input :role, as: :select, collection: ["graud"]
      f.input :street
      f.input :city
      f.input :state
      f.input :country, as: :country
      f.input :zipcode
    end
    f.actions
  end

  index do
    column :email
    column :age
    column :height
    column :dob
    column :role
    column :street
    column :city
    column :state
    column :country
    column :zipcode
    actions
  end

  show do |user|
    attributes_table do
      row :email
      row :age
      row :height
      row :dob
      row :role
      row :street
      row :city
      row :state
      row :country
      row :zipcode
      row :created_at
      row :updated_at
    end
  end
  permit_params :email, :password, :age, :height, :dob, :role, :street, :city, :state, :country, :zipcode

end
