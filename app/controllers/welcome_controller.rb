require 'algorithm'
class WelcomeController < ApplicationController
    protect_from_forgery with: :null_session

    def index
    end
    
    def professor
        @papers = Paper.all
        @students = Student.all
    end
    
    # Need a better method/function here that is more conventional
    def performAssignment
        @papers = Paper.all
        @students = Student.all
        @papers.each do |p|
            p.students_assigned = Array.new()
            @students.each do |s|
                #assignPaper(s,p)
            end
        end
        paperAssignment(@students,@papers)
        redirect_to professor_path
    end
    
    def sendEmail
        @student = Student.all[0]
        UserMailer.with(user: @student).welcome_email.deliver_now
    end
    
    def email_forms
        @papers = Paper.all
        @students = Student.all
        print params
        val = params[:student].to_i()
        @student = @students[val]
        @next = val + 1
        @prev = val - 1
    end
    
    def send_assignments
        @papers = Paper.all
        @students = Student.all
        print params
        val = params[:student].to_i()
        @student = @students[val]
        @next = val + 1
        @prev = val - 1
        @assignments = Array.new()
        if(val<@students.size())
            @papers.each do |paper|
                paper.students_assigned.each do |stud|
                    if(stud == @student.id)
                        @assignments.push(paper)
                    end
                end
            end
        end
    end
    
end
