class ActiveQuestionsController < ApplicationController
  before_action :set_active_question, only: [:show, :edit, :update, :destroy]

  # GET /active_questions
  # GET /active_questions.json
  def index
    @active_questions = ActiveQuestion.all
  end

  # GET /active_questions/1
  # GET /active_questions/1.json
  def show
  end

  # GET /active_questions/new
  def new
    @active_question = ActiveQuestion.new
  end

  # GET /active_questions/1/edit
  def edit
  end

  # POST /active_questions
  # POST /active_questions.json
  def create
    @active_question = ActiveQuestion.new(active_question_params)

    respond_to do |format|
      if @active_question.save
        format.html { redirect_to @active_question, notice: 'Active question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /active_questions/1
  # PATCH/PUT /active_questions/1.json
  def update
    respond_to do |format|
      if @active_question.update(active_question_params)
        format.html { redirect_to @active_question, notice: 'Active question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /active_questions/1
  # DELETE /active_questions/1.json
  def destroy
    @active_question.destroy
    respond_to do |format|
      format.html { redirect_to active_questions_url, notice: 'Active question was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_question
      @active_question = ActiveQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def active_question_params
      params.require(:active_question).permit(:question_id, :user_id)
    end
end
