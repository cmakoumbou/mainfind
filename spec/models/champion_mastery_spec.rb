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

require 'rails_helper'
require 'riotapi'

RSpec.describe ChampionMastery, type: :model do

  player = FactoryGirl.create(:player)
  champion_mastery = FactoryGirl.create(:champion_mastery, player: player)

  data = [{:summonerid => "31380896"},{:summonerid=> "37247094"}]
  players = data.map { |p| FactoryGirl.create(:player, p) }

  player_a = FactoryGirl.create(:player, topchampionid: "40")
  player_b = FactoryGirl.create(:player, topchampionid: "40")

  mastery_a = FactoryGirl.create(:champion_mastery, player: player_a, championid: "40")
  mastery_a2 = FactoryGirl.create(:champion_mastery, player: player_a, championid: "41")

  mastery_b = FactoryGirl.create(:champion_mastery, player: player_b, championid: "40")
  mastery_b2 = FactoryGirl.create(:champion_mastery, player: player_b, championid: "41")

  multi_players = [player_a, player_b]

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(champion_mastery).to be_valid
    end
    it "is not valid without points" do
      champion_mastery.points = nil
      expect(champion_mastery).to_not be_valid
    end

    it "is not valid without a championid" do
      champion_mastery.championid = nil
      expect(champion_mastery).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs to a player" do
      expect(described_class.reflect_on_association(:player).macro).to eq(:belongs_to)
    end
  end

  describe "Methods" do
    it "stores mastery points" do
      VCR.use_cassette('riotapi/get_mastery_points') do
        champion_masteries = ChampionMastery.store_mastery_points(player)
        expect(champion_masteries.count).to be > 1
      end
    end

    it "stores mastery points for multiple players" do
      VCR.use_cassette('riotapi/get_multiple_mastery_points') do
        multiple_champion_masteries = ChampionMastery.store_multiple_mastery_points(players)
        expect(multiple_champion_masteries[0][0]["playerId"]).to eq(31380896)
        expect(multiple_champion_masteries[1][0]["playerId"]).to eq(37247094)
      end
    end

    it "excludes the player's top champion" do
      player_two = FactoryGirl.create(:player, topchampionid: "17")
      a = FactoryGirl.create(:champion_mastery, player: player_two, championid: "10")
      b = FactoryGirl.create(:champion_mastery, player: player_two, championid: "17")
      without_top_champion = ChampionMastery.exclude_top_champion(player_two)
      expect(without_top_champion.count).to be == 1
    end
  end
end
