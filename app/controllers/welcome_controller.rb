require 'algorithm'
class WelcomeController < ApplicationController
    protect_from_forgery with: :null_session

    def index
    end
    
    def professor
        @papers = Paper.all
        @students = Student.all
        #performAssignment()
    end
    
    # Need a better method/function here that is more conventional
    def performAssignment
        print "\n TEST TEST \n"
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
    
end
