class PapersController < ApplicationController
  
  def paper_params
    params.require(:paper).permit(:title)
  end
  
  def index
    @papers = Paper.order(:title)
  end
  
  def create
    @paper = Paper.create!(paper_params)
    flash[:notice] = "#{@paper.title} was successfully created."
    redirect_to papers_path
  end
  
  def new
  end
  
end
