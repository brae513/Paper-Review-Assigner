class PapersController < ApplicationController
  
  def index
    @papers = Paper.order(:title)
  end
  
  def new
    @paper = Paper.create!()
    flash[:notice] = "#{@paper.title} was successfully created."
    redirect_to papers_path
  end
  
end
