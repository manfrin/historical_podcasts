class AddEpisodeData < ActiveRecord::Migration
  def change
  	add_column :episodes, :external_link, :string
  	add_column :episodes, :description, :text
  	add_column :episodes, :pub_date, :datetime
  	add_column :episodes, :position, :integer
  end
end
