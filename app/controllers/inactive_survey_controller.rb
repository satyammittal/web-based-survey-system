class InactiveSurveyController < ApplicationController
  def create
    is =  InactiveSurvey.new
    print :choice_params
    is.choice_id=params[:type]
    print "saasa\n"
#  print current_user.id
    is.user_id=current_user.id
    is.question_id=Choice.find(params[:type]).question_id;
    is.save
    @surveys=InactiveSurvey.where(user_id: current_user.id)
  end
  def show
    @surveys=InactiveSurvey.where(user_id: current_user.id)
  end
  def adminshow
      @isurvey = InactiveSurvey.all
  end
end
