class LandingsController < ApplicationController
  def index
  	@podcasts = Podcast.all
  end
end
