class Ad < ApplicationRecord
  belongs_to :district

  validates :url, uniqueness: true
end
