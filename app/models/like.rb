class Like < ActiveRecord::Base
  attr_accessible :movie_id, :user_id
  belongs_to :user
  belongs_to :movie
  validates_uniqueness_of :movie_id, :scope => :user_id
end
