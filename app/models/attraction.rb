class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  validates :name, presence: true
  validates :min_height, presence: true
  validates :happiness_rating, presence: true, inclusion: {in: 1..10, message: 'must be between 1 and 10'}
  validates :nausea_rating, presence: true, inclusion: {in: 1..10, message: 'must be between 1 and 10'}
  validates :tickets, presence: true, inclusion: {in: 1..10, message: 'must be between 1 and 10'}
end
