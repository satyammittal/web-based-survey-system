class AddFullsurveyToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :fullsurvey, index: true, foreign_key: true
  end
end
