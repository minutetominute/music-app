require_relative 'type_helper'

class Album < ActiveRecord::Base
  RECORDING_TYPES = [
    "Live",
    "Studio"
  ]

  include TypeHelper

  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :track_type, inclusion: { in: RECORDING_TYPES }

end
