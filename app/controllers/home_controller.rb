class HomeController < ApplicationController
  def index
    @Question=Question.all;
    @surveys=InactiveSurvey.all
  #  @Ques=Choices.find_by_question_id(0)
#    print @Ques
  end
  def survey
    @surveys=Fullsurvey.all
    @completed=Completed.where(user_id: current_user.id)
    @Question=Question.all;
  end
  def madesurvey
    g=0
    ques=Question.all
    b=0
    count=0
    params["parr"].each do |parr|
      chid=parr["choice_id"]
      if(parr["choice_id"] && !Choice.find_by_id(parr["choice_id"]))
          r=Choice.new
          r.options=chid
          ques=Question.where(fullsurvey_id: g)
          o=ques[count].id
          r.question_id=o
          print params["surveyid"]
          r.save
          chid=r.id
      end
      count+=1
      t=InactiveSurvey.new
      t.choice_id=chid
      t.user_id=current_user.id
      t.question_id=Choice.find_by_id(chid).question_id
      b=Choice.find_by_id(chid).question_id
      ques=Question.where(fullsurvey_id: g)
      surveyid=Choice.find_by_id(chid).question.fullsurvey_id
      g=surveyid
      t.save
      #InactiveSurvey.create(parr_params)
    end
    c=Completed.new
    c.user_id=current_user.id
    c.fullsurvey_id=g
    c.save
    redirect_to home_survey_path
  end
  def completedsurvey
    @surveys=Fullsurvey.all
    @completed=Completed.where(user_id: current_user.id)
  end
  def profile
    @current_user=current_user
  end
  def showsurvey
    @Question=Question.where(fullsurvey_id: params[:type])
    @surveyid=params[:type]
    @surveys=InactiveSurvey.where(user_id: current_user.id)
    @array=Array.new
    count=0;
    @Question.each do |question|
      if not @surveys.find_by_question_id(question.id)
        count+=1
      end
    end
    y=count
    ques=Question.where(fullsurvey_id: params[:type])
    $arr=Array.new(count,InactiveSurvey.new);
    $arr.each_with_index do |item, i|
          item=InactiveSurvey.new
          item.user_id=current_user.id
          item.question_id=ques[i].id
          y-=1;
    end
    print $arr
    $a=count
  end
  def show
  end
  private
    def parr_params
      params.require(:parr).permit(:choice)
    end
end
