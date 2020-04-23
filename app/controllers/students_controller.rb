class StudentsController < ApplicationController
  
  def student_params
    params.require(:student).permit(:name,:email,:classification, :paper_history)
  end
  
  def index
    @students = Student.all
  end
  
  def create
    @student = Student.create!(student_params)
    @student.update_attribute(:user, current_user.id)
    flash[:notice] = "#{@student.name} was successfully created."
    @student.save
    redirect_to students_path
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Student '#{@student.name}' deleted."
    redirect_to students_path
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def edit
    @student = Student.find(params[:id])
    @senior = @student.classification.eql?("Senior")
  end
  
  def update 
    @student = Student.find params[:id]
    @student.update_attributes!(student_params)
    flash[:notice] = "#{@student.name} was successfully updated."
    redirect_to students_path
  end
  
  
  def new
  end
  
  def class_choice
    #returns an array of choices that will be used for the dropdown menu for editing students
    #why are student classifications a string instead of any other kind of class...
  end
end
