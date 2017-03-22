class CreateChampionMasteries < ActiveRecord::Migration[5.0]
  def change
    create_table :champion_masteries do |t|
      t.string :points
      t.string :championid
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
