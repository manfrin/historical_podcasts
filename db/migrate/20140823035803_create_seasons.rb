class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.references :podcast, index: true

      t.timestamps
    end
  end
end
