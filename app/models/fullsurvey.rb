class Fullsurvey < ActiveRecord::Base
  has_many :question,dependent: :destroy
end
