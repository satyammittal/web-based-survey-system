class CreateInactiveSurveys < ActiveRecord::Migration
  def change
    create_table :inactive_surveys do |t|
      t.references :choice, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
