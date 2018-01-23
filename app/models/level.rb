class Level < ApplicationRecord
  belongs_to :user

  validates :name,    presence: true, length: { maximum: 100 }
  validates :code,    presence: true
  validates :user_id, presence: true

  has_many :scores
end
