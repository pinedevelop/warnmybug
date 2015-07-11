class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :project_id
      t.string :notification_type
      t.string :message
      t.string :url

      t.timestamps null: false
    end
  end
end
