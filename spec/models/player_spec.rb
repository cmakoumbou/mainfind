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
  let(:player) { build(:player) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(player).to be_valid
    end

    it "is not valid without a summonerid" do
      player.summonerid = nil
      expect(player).to_not be_valid
    end

    it "is not valid without a name" do
      player.name = nil
      expect(player).to_not be_valid
    end

    it "is not valid without a tier" do
      player.tier = nil
      expect(player).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many champion_mastery" do
      expect(described_class.reflect_on_association(:champion_mastery).macro).to eq(:has_many)
    end
  end

  describe "Methods" do
    it "stores challenger players" do
      VCR.use_cassette('riotapi/get_challenger_league') do
        players = Player.store_challenger_players
        expect(players.count).to eq(200)
      end
    end
  end
end
