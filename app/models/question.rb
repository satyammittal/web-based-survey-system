class Question < ActiveRecord::Base
  has_many :choice,dependent: :destroy
  belongs_to :fullsurvey
end
