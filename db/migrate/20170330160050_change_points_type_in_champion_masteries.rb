class ChangePointsTypeInChampionMasteries < ActiveRecord::Migration[5.0]
  def self.up
    change_column :champion_masteries, :points, 'integer USING CAST(points AS integer)'
  end

  def self.down
    change_column :champion_masteries, :points, :string
  end
end
