class WelcomeController < ApplicationController
    def index
    end
    
    def professor
        @papers = Paper.all
        @students = Student.all
    end
end
