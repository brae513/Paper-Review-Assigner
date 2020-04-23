class AddStudentDefaults < ActiveRecord::Migration[6.0]
  #create defaults for columns, in hopes of preventing "invalid method for this row" errors on heroku
  def up
    #change_column_default(:students, :uin, 888008880)
    change_column_default(:students, :classification, "Senior")
    change_column_default(:students, :paper_preference, "")
    change_column_default(:students, :paper_history, "0")
  end
  
  def down
    #change_column_default(:students, :uin, nil)
    change_column_default(:students, :classification, nil)
    change_column_default(:students, :paper_preference, nil)
    change_column_default(:students, :paper_history, nil)
  end
end