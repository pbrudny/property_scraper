class Note < ApplicationRecord
  belongs_to :ad

  validates :body, presence: true
  validates :ad, presence: true
end
