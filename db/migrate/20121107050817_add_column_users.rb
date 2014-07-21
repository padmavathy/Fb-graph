class AddColumnUsers < ActiveRecord::Migration
  def up
    add_column :users,:name,:string
    add_column :users,:age,:integer
    add_column :users,:mobile,:integer
    add_column :users,:address,:string
    add_column :users,:city,:string
    add_column :users,:state,:string
  end

  def down
    remove_column :users,:name
    remove_column :users,:age
    remove_column :users,:mobile
    remove_column :users,:address
    remove_column :users,:city
    remove_column :users,:state
  end
end
