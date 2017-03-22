# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  summonerid :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  tier       :string
#

class Player < ApplicationRecord
  has_many :champion_mastery
  validates_presence_of :summonerid, :name, :tier

  def self.store_challenger_players
    client = RiotApi.new
    response = client.get_challenger_league
    response['entries'].each do |x|
      Player.create(summonerid: x['playerOrTeamId'], name: x['playerOrTeamName'], tier: 'Challenger')
    end
  end
end
