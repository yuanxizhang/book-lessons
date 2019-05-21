class SkillsController < ApplicationController
	before_action :find_skill, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

	def index
		if params[:section_id]
        	@instructor = Section.find(params[:section_id])
        	@skills = @section.skills.order('name ASC')
    	else
		    @skills = Skill.all.order('name ASC')
    	end
	end

	def new
		@section = Section.find(params[:section_id])
		@skill = Skill.new
	end

	def show

	end

	def create
		@section = Section.find(params[:section_id])
  		@skill = Skill.new(skill_params)

	  if @skill.valid?
	  	@skill.save
	  	redirect_to skill_path(@skill)
	  else
	  	render :new
	  end
	end

	def edit

	end

	def update

	  @skill.update(skill_params)
	  if @skill.save
	  	redirect_to skill_path(@skill)
	  else
	  	render :edit
	  end
	end

	private

	def find_skill
    	@skill = Skill.find_by(id: params[:id])
 	end

	def skill_params
    	params.require(:skill).permit(:name, :section_id)
 	 end

end
