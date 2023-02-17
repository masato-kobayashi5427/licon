class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birth_day, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
