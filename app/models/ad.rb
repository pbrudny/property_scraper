class Ad < ApplicationRecord
  belongs_to :district

  validates :url, presence: true
end
