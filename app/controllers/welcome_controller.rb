require 'algorithm'
class WelcomeController < ApplicationController
    def index
    end
    
    def professor
        @papers = Paper.all
        @students = Student.all
        performAssignment()
    end
    
    # Need a better method/function here that is more conventional
    def performAssignment
        @papers.each do |p|
            p.students_assigned = Array.new()
            @students.each do |s|
                #assignPaper(s,p)
            end
        end
        paperAssignment(@students,@papers)
    end
    #redirect_to professors_path
end
