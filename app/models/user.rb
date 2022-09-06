class User < ApplicationRecord
  has_many :relations
  has_many :events, through: :relations
end
