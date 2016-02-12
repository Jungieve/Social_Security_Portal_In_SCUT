class User < ActiveRecord::Base
  has_many :micropost
  validates :name, presence: true
  validates :email, presence: true
end
