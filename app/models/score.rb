class Score < ApplicationRecord
  belongs_to :level
  belongs_to :user

  default_scope -> { order(score: :desc) }
end
