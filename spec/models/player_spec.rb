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

require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { create(:player) }

  data = [{:summonerid => "31380896"},{:summonerid=> "37247094"}]
  multiple_players = data.map { |p| FactoryGirl.create(:player, p) }

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

    it "stores top champion for a player" do
      VCR.use_cassette('riotapi/get_top_champion') do
        player_top_champion = Player.store_top_champion(player)
        expect(player_top_champion.topchampionid).to eq("27")
      end
    end

    it "stores top champions for multiple players" do
      VCR.use_cassette('riotapi/get_multiple_top_champions') do
        multiple_top_champions = Player.store_multiple_top_champions(multiple_players)
        expect(multiple_top_champions[0]["topchampionid"]).to eq("222")
        expect(multiple_top_champions[1]["topchampionid"]).to eq("64")
      end
    end
  end
end
