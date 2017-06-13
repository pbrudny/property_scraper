class Ad < ApplicationRecord
  belongs_to :load
  belongs_to :district
  belongs_to :search_link

  has_many :images, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates :offer_id, uniqueness: true
  validates :search_link, presence: true
  validates :district, presence: true
  validates :status, presence: true
  validates :load, presence: true

  scope :not_rejected, -> { where.not status: 'not_interesting' }

  def mark_interesting!
    update(status: 'interesting')
  end

  def mark_not_interesting!
    update(status: 'not_interesting')
  end

  def images_list
    [image_path] + images.map(&:url)
  end
end
