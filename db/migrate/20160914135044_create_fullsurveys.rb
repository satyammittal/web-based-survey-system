class CreateFullsurveys < ActiveRecord::Migration
  def change
    create_table :fullsurveys do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
