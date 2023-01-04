class Booking < ApplicationRecord
  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
  paginates_per 3

  # validates :status, presence: true
  STATUSES = ['pending', 'reject', 'done']

  validates :pickup_address, presence: true
  validates :pickup_city, presence: true
  validates :pickup_state, presence: true
  validates :pickup_date, presence: true
  validates :pickup_timing, presence: true
  validates :deliver_address, presence: true
  validates :deliver_city, presence: true
  validates :deliver_state, presence: true
end
