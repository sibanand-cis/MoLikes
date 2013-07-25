class User < ActiveRecord::Base
  attr_accessible :email, :name
  validates_uniqueness_of :email
  has_one :movie,:through => :like
  has_many :likes
end
