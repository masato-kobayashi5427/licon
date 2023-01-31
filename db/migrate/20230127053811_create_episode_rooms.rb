class CreateEpisodeRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :episode_rooms do |t|
      t.string :name, null: false
      t.references :episode, null: false, foreign_key: true
      t.timestamps
    end
  end
end
