class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :lyrics
      t.integer :num_beats

      t.timestamps
    end
  end
end
