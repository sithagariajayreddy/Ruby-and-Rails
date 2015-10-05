class CreateStudentsSectionsJoin < ActiveRecord::Migration
  def up
    create_table :students_sections, :id => false do |t|
      t.integer "student_id"
      t.integer "section_id"
    end
     add_index :students_sections, ["student_id", "section_id"]
  end   


  def down
    drop_table :students_sections
  end
end
