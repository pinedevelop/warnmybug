class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.integer :project_id
      t.string :name
      t.string :uid

      t.timestamps null: false
    end
  end
end
