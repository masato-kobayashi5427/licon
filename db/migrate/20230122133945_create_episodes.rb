class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.string :title, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.string :category, null: false
      t.integer :limit, null: false
      t.integer :period, null: false
      t.string :image_url
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
