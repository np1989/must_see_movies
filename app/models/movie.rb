class Movie < ActiveRecord::Base

  validates :title , :presence => true
  validates :duration , :presence => true
  belongs_to :director
end
