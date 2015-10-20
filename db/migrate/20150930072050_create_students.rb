class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "username", :limit => 50
      t.string "email", :default => true, :null => false
      t.string "password", :limit => 8
      t.timestamps null: false
    end
  end
end
