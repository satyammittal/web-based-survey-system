class FullsurveyController < ApplicationController
  before_action :set_fullsurvey, only: [:show, :edit, :update, :destroy]
  before_action :admin_user
  def new
    @survey =   Fullsurvey.new
  end

  def create
		@survey = Fullsurvey.new(fullsurvey_params)
		if @survey.save
			flash[:success] = "survey created"
			redirect_to @survey
	  else
        	render "new"
		end
	end
  def show
  end
  def index
    @survey=Fullsurvey.all
  end
  def edit
  end
  def update
    respond_to do |format|
      if @fullsurvey.update(fullsurvey_params)
        format.html { redirect_to @fullsurvey, notice: 'Full Survey was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @fullsurvey.destroy
    respond_to do |format|
      format.html { redirect_to fullsurvey_url, notice: 'Full survey was successfully destroyed.' }
    end
  end
	private
    def set_fullsurvey
      @fullsurvey = Fullsurvey.find(params[:id])
    end
		def fullsurvey_params
			params.require(:fullsurvey).permit(:name)
		end

end
