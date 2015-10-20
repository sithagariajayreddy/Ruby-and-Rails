class AddpasswordDigestToStudents < ActiveRecord::Migration
  def up
    remove_column "students", "password"
    add_column "students", "password_digest", :string
  end

  def down
     add_column "students", "password", :string
     remove_column "students", "password_digest"
  end
end
