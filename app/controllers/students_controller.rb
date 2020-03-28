class StudentsController < ApplicationController
  
  def student_params
    params.require(:student).permit(:name,:email,:classification)
  end
  
  def index
    @students = Student.all
  end
  
  def create
    @student = Student.create!(student_params)
    flash[:notice] = "#{@student.name} was successfully created."
    @student.save
    redirect_to students_path
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Movie '#{@student.name}' deleted."
    redirect_to students_path
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def new
  end
end
