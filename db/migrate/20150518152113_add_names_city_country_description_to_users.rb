class AddNamesCityCountryDescriptionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :description, :text
  end

  def self.down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :city, :string
    remove_column :users, :country, :string
    remove_column :users, :description, :text
  end
end
