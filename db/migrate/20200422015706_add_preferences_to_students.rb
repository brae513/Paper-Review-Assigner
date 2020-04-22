class AddPreferencesToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :paper_preference, :text
  end
end
