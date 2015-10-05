class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string "page_id"
      t.string "name", :limit => 25
      t.integer "position", :limit => 8
      t.boolean "visible", :default => false
      t.string "content_type"
      t.text   "content"
      t.timestamps null: false
    end
    add_index("sections", "page_id")
  end
end
