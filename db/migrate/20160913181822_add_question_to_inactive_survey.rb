class AddQuestionToInactiveSurvey < ActiveRecord::Migration
  def change
    add_reference :inactive_surveys, :question, index: true, foreign_key: true
  end
end
