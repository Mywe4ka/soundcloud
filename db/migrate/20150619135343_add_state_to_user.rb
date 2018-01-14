class AddStateToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :aasm_state, :string
  end

  def self.down
    remove_column :users, :aasm_state, :string
  end
end
