class CreateEforms < ActiveRecord::Migration[6.0]
  def change
    create_table :eforms do |t|
      t.integer :form_uin
      t.text :picked_preference
      t.timestamps
    end
  end
end
