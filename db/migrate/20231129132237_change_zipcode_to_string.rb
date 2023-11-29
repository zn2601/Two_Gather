class ChangeZipcodeToString < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :zipcode, :string
  end
end
