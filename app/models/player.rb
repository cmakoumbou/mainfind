# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  summonerid    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string
#  tier          :string
#  topchampionid :string
#

class Player < ApplicationRecord
  has_many :champion_mastery, dependent: :destroy
  validates_presence_of :summonerid, :name, :tier

  def self.store_challenger_players
    client = RiotApi.new
    response = client.get_challenger_league
    response['entries'].each do |x|
      player = Player.find_by(summonerid: x['playerOrTeamId'])
      if player.blank?
        Player.create(summonerid: x['playerOrTeamId'], name: x['playerOrTeamName'], tier: 'Challenger')
      else
        Player.update(player.id, name: x['playerOrTeamName'], tier: 'Challenger')
      end
    end
  end

  def self.store_top_champion(player)
    client = RiotApi.new
    response = client.get_top_champion(player.summonerid)
    if !Rails.env.test?
      sleep 1.5
    end
    Player.update(player.id, topchampionid: response[0]["championId"])
  end

  def self.store_multiple_top_champions(players)
    players.map do |x|
      Player.store_top_champion(x)
    end
  end
end
