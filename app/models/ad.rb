class Ad < ApplicationRecord
  STATUSES = %w(new interesting not_interesting not_available in_progress rejected accepted)

  belongs_to :load
  belongs_to :district
  belongs_to :search_link

  has_many :appointments, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates :offer_id, uniqueness: true
  validates :search_link, presence: true
  validates :district, presence: true
  validates :status, presence: true
  validates :load, presence: true

  scope :new_ads, -> { where status: 'new' }
  scope :interesting, -> { where status: 'interesting' }
  scope :in_progress, -> { where status: 'in_progress' }
  scope :accepted, -> { where status: 'accepted' }

  def mark_interesting!
    Ads::MarkInterestingAd.new(self).call
  end

  def interesting?
    status == 'interesting'
  end

  def mark_not_interesting!
    update(status: 'not_interesting')
  end

  def mark_accepted!
    update(status: 'accepted')
  end

  def mark_in_progress!
    update(status: 'in_progress')
  end

  def mark_rejected!
    update(status: 'rejected')
  end

  def images_list
    [image_path] + images
  end
end
