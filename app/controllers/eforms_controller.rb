class EformsController < ApplicationController
  # FORM
  def eform_params
    params.require(:eform).permit(:form_uin,:picked_preference)
  end
  def index
    @papers = Paper.all
    @students = Student.all
    @eforms = Eform.all
  end
  def new
    @papers = Paper.all
    @students = Student.all
    @eforms = Eform.all
  end
  def show
    @papers = Paper.all
    @students = Student.all
    @student = Student.find params[:id]
    @options = Array.new()
    arr = Array.new()
    arr.push("none")
    arr.push(-1)
    @options.push(arr)
    i=0
    @papers.each do |x|
        print "\n"
        arr = Array.new()
        arr.push(x.title)
        arr.push(x.id)
        @options.push(arr)
        i+=1
    end
  end
  def create
    @papers = Paper.all
    @students = Student.all
    @eform = Eform.create!(eform_params)
    @matched_student = Student.where({uin: "#{@eform.form_uin}"}).update_all({paper_preference: "Preference Array Goes Here"})
    flash[:notice] = "Form created."
    redirect_to eforms_submission_verification_path
  end
  def submission_verification
    @papers = Array.new()
    @student = Student.find(params[:student])
    @student.paper_preference.each do |paper|
      if paper!=-1
        @papers.push(Paper.find(paper))
      end
    end
    @students = Student.all
    @eforms = Eform.all
  end
  def update
    @student = Student.find params[:id]
    #@student.paper_preference = Array.new()
    pref = Array.new()
    pref.push(params[:pref1].to_i)
    pref.push(params[:pref2].to_i)
    pref.push(params[:pref3].to_i)
    pref.push(params[:pref4].to_i)
    pref.push(params[:pref5].to_i)
    @student.paper_preference=pref
    @student.update_attribute(:paper_preference,pref)
    print 'test\n'
    print params
    print '\n'
    print @student.paper_preference
    print "\n"
    redirect_to submission_verification_path student: @student.id
  end
end
