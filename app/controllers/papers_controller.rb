class PapersController < ApplicationController
  
  def paper_params
    params.require(:paper).permit(:title, :paper_id)
  end
  
  def index
    @papers = Paper.all
  end
  
  def create
    @paper = Paper.create!(paper_params)
    flash[:notice] = "#{@paper.title} was successfully created."
    @paper.save
    redirect_to papers_path
  end
  
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy
    flash[:notice] = "Paper '#{@paper.title}' deleted."
    redirect_to papers_path
  end
  
  def new
  end
  
  def show
    @paper = Paper.find(params[:id])
  end
  
end