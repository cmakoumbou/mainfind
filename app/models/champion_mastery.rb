# == Schema Information
#
# Table name: champion_masteries
#
#  id         :integer          not null, primary key
#  points     :string
#  championid :string
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChampionMastery < ApplicationRecord
  belongs_to :player
  validates_presence_of :points, :championid

  def self.store_mastery_points(player)
    client = RiotApi.new
    response = client.get_mastery_points(player.summonerid)
    if !Rails.env.test?
      sleep 1.5
    end
    response.each do |x|
      ChampionMastery.create(points: x['championPoints'], championid: x['championId'], player_id: player.id)
    end
  end

  def self.store_multiple_mastery_points(players)
    players.map do |x|
      ChampionMastery.store_mastery_points(x)
    end
  end

  def self.exclude_top_champion(player)
    ChampionMastery.where(player: player).where.not(championid: player.topchampionid)
  end
end
