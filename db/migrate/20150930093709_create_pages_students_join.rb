class CreatePagesStudentsJoin < ActiveRecord::Migration
  def up
    create_table :pages_students, :id => false do |t|
      t.integer "page_id"
      t.integer "student_id"
    end
   add_index :pages_students, ["page_id","student_id"]
  end




  def down
    drope_table :pages_students 
  end
end
