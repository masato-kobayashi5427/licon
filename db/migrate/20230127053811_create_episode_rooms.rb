class CreateEpisodeRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :episode_rooms do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
