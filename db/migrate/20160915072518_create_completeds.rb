class CreateCompleteds < ActiveRecord::Migration
  def change
    create_table :completeds do |t|
      t.references :fullsurvey, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
