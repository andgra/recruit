class Company < ApplicationRecord
  has_many :jobs
  validates :name, presence: true
  validates :location, presence: true

  include ActionController::Serialization
end
