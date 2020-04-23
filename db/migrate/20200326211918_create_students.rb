class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :uin
      t.string :email
      t.string :classification
      t.text :paper_preference
      t.integer :paper_history
      t.integer :current_papers
      
      t.timestamps
    end
  end
end