class SearchLink < ApplicationRecord
  belongs_to :site
  belongs_to :district

  has_many :ads
end
