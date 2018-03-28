class Apply < ApplicationRecord
  belongs_to :geek
  belongs_to :job
  validates :job_id, presence: true, numericality: true
  validates :geek_id, presence: true, numericality: true

  include ActionController::Serialization
end
