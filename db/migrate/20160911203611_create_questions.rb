class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.timestamp :created_at

      t.timestamps null: false
    end
  end
end
