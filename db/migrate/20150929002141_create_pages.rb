class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "name", :limit => 25
      t.string "permalink", :limit => 8
      t.integer "position", :limit => 5
      t.boolean "visible", :default => false
      t.timestamps null: false
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end


  def down
    drop_table :pages
  end
end
