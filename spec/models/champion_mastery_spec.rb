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

RSpec.describe ChampionMastery, type: :model do
  let(:player) { build(:player) }
  let(:champion_mastery) { build(:champion_mastery) }

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
    it "store champion masteries" do
      VCR.use_cassette('riotapi/get_mastery_points') do
        champion_masteries = ChampionMastery.store_mastery_points(player)
        expect(champion_masteries.count).to be > 1
      end
    end
  end
end
