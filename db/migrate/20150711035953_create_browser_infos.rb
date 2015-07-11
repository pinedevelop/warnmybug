class CreateBrowserInfos < ActiveRecord::Migration
  def change
    create_table :browser_infos do |t|
      t.integer :notification_id
      t.string :app_code_name
      t.string :app_name
      t.string :app_version
      t.boolean :cookie_enabled
      t.string :hardware_concurrency
      t.string :language
      t.text :mime_types
      t.boolean :online
      t.string :platform
      t.text :plugins
      t.string :product
      t.string :product_sub
      t.string :user_agent
      t.string :vendor
      t.string :vendor_sub

      t.timestamps null: false
    end
  end
end
