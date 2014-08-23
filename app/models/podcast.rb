class Podcast < ActiveRecord::Base
  belongs_to :user
  has_many :seasons
end
