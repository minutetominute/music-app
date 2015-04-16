require_relative 'type_helper'

class Track < ActiveRecord::Base
  TRACK_TYPES = [
    "Regular",
    "Bonus"
  ]
  include TypeHelper

  belongs_to :album

  validates :track_type, inclusion: { in: TRACK_TYPES }
end
