class AddPaperhistoryToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :paper_history, :integer
  end
end
