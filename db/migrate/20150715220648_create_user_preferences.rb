class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.integer :user_id
      t.integer :environment_id
      t.boolean :email

      t.timestamps null: false
    end
  end
end
