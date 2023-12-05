class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :asker, null: false, foreign_key: { to_table: :users }
      t.references :helper, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
