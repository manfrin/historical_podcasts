class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :season, index: true
      t.string :title
      t.string :slug
      t.string :url

      t.timestamps
    end
  end
end
