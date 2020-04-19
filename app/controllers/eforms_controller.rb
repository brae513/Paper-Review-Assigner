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
  def create
    @papers = Paper.all
    @students = Student.all
    @eform = Eform.create!(eform_params)
    @matched_student = Student.where({uin: "#{@eform.form_uin}"}).update_all({paper_preference: "Preference Array Goes Here"})
    flash[:notice] = "Form created."
    redirect_to eforms_submission_verification_path
  end
  def submission_verification
    @papers = Paper.all
    @students = Student.all
    @eforms = Eform.all
  end
end
