class Season < ActiveRecord::Base
  belongs_to :podcast
  has_many :episodes
end
