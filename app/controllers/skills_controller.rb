class SkillsController < ApplicationController
	before_action :find_skill, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

	def index
		@skills = Skill.all
	end

	def new
		@skill = Skill.new
	end

	def show

	end

	def create
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
    @skill = skill.find_by(id: params[:id])
  end

	def skill_params
    params.require(:skill).permit(:name)
  end

end
