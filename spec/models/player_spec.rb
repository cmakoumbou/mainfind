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

require 'rails_helper'

RSpec.describe Player, type: :model do
  it "stores challenger players" do
    VCR.use_cassette('riotapi/get_challenger_league') do
      players = Player.store_challenger_players
      expect(players.count).to eq(200)
    end
  end
end
