class CreateEnvironmentPreferences < ActiveRecord::Migration
  def change
    create_table :environment_preferences do |t|
      t.integer :environment_id
      t.boolean :log
      t.boolean :warn
      t.boolean :error

      t.timestamps null: false
    end
  end
end
