class AddNameAndZipcodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :zipcode, :integer
  end
end
