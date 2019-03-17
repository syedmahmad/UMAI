class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :name
      t.boolean :archive, :default => true
      t.integer :list_id, :null => false, :references => [:list, :id]
      t.timestamps null: false
    end
  end
end
