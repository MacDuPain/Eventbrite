class Event < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user


end
