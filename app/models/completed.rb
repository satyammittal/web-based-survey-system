class Completed < ActiveRecord::Base
  belongs_to :fullsurvey
  belongs_to :user
end
