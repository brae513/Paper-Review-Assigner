class CreatePapers < ActiveRecord::Migration[6.0]
  def change
    create_table :papers do |t|
      t.string :title
      t.integer :paper_id
      t.string :description
      t.text :students_assigned
      
      t.timestamps
    end
  end
end
