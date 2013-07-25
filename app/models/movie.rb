class Movie < ActiveRecord::Base
  attr_accessible :genre, :title, :year
  has_many :users, :through => :likes
  has_many :likes
  validates :title,:presence => true
end
