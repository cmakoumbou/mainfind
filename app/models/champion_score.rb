# == Schema Information
#
# Table name: champion_scores
#
#  id               :integer          not null, primary key
#  points           :string
#  championid       :string
#  main_champion_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ChampionScore < ApplicationRecord
  belongs_to :main_champion
  validates_presence_of :points, :championid

  def self.store_champion_scores(masteries, main)
    masteries.each do |x|
      championscore = ChampionScore.find_by(championid: x.championid, main_champion_id: main.id)
      if championscore.blank?
        ChampionScore.create(championid: x.championid, points: x.points, main_champion_id: main.id)
      else
        new_points = x.points + championscore.points
        ChampionScore.update(championscore.id, points: new_points)
      end
    end
  end
end
