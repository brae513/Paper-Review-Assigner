class CreatePapers < ActiveRecord::Migration[6.0]
  def change
    create_table :papers do |t|
      t.string :title
      t.string :paper_id
      t.string :description
      t.text :students_assigned
      
      t.string :professor_email
      t.timestamps
    end
  end
end
