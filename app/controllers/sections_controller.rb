class SectionsController < ApplicationController

  def index
    @section = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:success] = "Section was created successfully"
      redirect_to sections_path
    else
      render 'new'
    end
  end

  def show
  end


  private
  def section_params
    params.require(:section).permit(:name)
  end



end
