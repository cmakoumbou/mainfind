class CreateChampionScores < ActiveRecord::Migration[5.0]
  def change
    create_table :champion_scores do |t|
      t.string :points
      t.string :championid
      t.references :main_champion, foreign_key: true

      t.timestamps
    end
  end
end
