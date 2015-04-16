require_relative 'type_helper'

class Band < ActiveRecord::Base
  include TypeHelper

  has_many :albums, dependent: :destroy
end
