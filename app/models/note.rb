class Note < ApplicationRecord
  belongs_to :ad
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  validates :ad, presence: true
end
