class AddAdditionalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :occupation, :string
    add_column :users, :about, :text
  end
end
