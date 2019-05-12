class SectionsController < ApplicationController
	before_action :find_section, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

	def index
		@sections = Section.all
	end

	def new
		@section = Section.new
	end

	def show

	end

	def create
	  @section = Section.new(section_params)

	  if @section.valid?
	  	@section.save
	  	redirect_to section_path(@section)
	  else
	  	render :new
	  end
	end

	def edit

	end

	def update

	  @section.update(section_params)
	  if @section.save
	  	redirect_to section_path(@section)
	  else
	  	render :edit
	  end
	end

	private

	def find_section
    @section = Section.find_by(id: params[:id])
  end

	def section_params
    params.require(:section).permit(:name)
  end

end
