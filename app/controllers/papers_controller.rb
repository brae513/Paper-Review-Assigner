class PapersController < ApplicationController
  def paper_params
    params.require(:paper).permit(:title,:paper_id,:description)
  end
  
  def index
    @papers = Paper.all
  end
  
  def create
    @paper = Paper.create!(paper_params)
    @student.update_attribute(:user, current_user.id)
    flash[:notice] = "#{@paper.title} was successfully created."
    @paper.save
    redirect_to papers_path
  end
  
  def destroy
    @paper = Paper.find(params[:id])
    @students = Student.all
    @students.each do |student|
      @prefs = student.paper_preference
      @prefs.each do |x|
        if x == @paper.id
          @prefs.delete(x)
          student.update_attribute(:paper_preference, @prefs)
        end
      end
    end
        
    @paper.destroy
    flash[:notice] = "Paper '#{@paper.title}' deleted."
    redirect_to papers_path
  end
  
  def show
    @paper = Paper.find(params[:id])
  end
  
  def update 
    if params[:type] == "add"
      @paper = Paper.find params[:id]
      @student = Student.find params[:student]
      @paper.students_assigned.push(@student.id)
      @paper.update_attribute(:students_assigned,@paper.students_assigned)
      flash[:notice] = "#{@paper.title} was successfully updated."
      redirect_to professor_path
    elsif params[:type] == "rem"
      print "\n REMOVING \n"
      @paper = Paper.find params[:id]
      @student = Student.find params[:student]
      @paper.students_assigned.each do |x|
        if(x==@student.id)
          @paper.students_assigned.delete(x)
        end
      @paper.update_attribute(:students_assigned,@paper.students_assigned)

      end
      redirect_to professor_path
    end
  end
  
  def edit
    @paper = Paper.find(params[:id])
    @students = Student.all
    @onPaper = Array.new()
    @paper.students_assigned.each do |x|
      @onPaper.push(x)
    end
    @options = Array.new()
    print @options
    @students.each do |x|
      if(!@onPaper.include?(x.id))
        arr = Array.new()
        arr.push(x.name)
        arr.push(x.id)
        @options.push(arr)
      end
    end
  end
  
  def new
  end
end
