class AddQuestypeToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :questype, :integer
  end
end
