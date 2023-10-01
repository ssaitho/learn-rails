class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :age
      t.string :birthday
      t.string :height
      t.string :weight
      t.string :hometown
      t.string :pitching_and_batting

      t.timestamps
    end
  end
end
