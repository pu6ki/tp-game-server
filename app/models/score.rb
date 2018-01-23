class Score < ApplicationRecord
  belongs_to :level
  belongs_to :user

  default_scope -> { order(value: :desc) }
end
