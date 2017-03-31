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

require 'rails_helper'

RSpec.describe ChampionScore, type: :model do

  champion_score = FactoryGirl.create(:champion_score)

  main = FactoryGirl.create(:main_champion)

  data = [{:championid => "20"},{:championid=> "30"}]
  masteries = data.map { |p| FactoryGirl.create(:champion_mastery, p) }

  let!(:masterie) { FactoryGirl.create_list(:champion_mastery, 2) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(champion_score).to be_valid
    end
    it "is not valid without points" do
      champion_score.points = nil
      expect(champion_score).to_not be_valid
    end

    it "is not valid without a championid" do
      champion_score.championid = nil
      expect(champion_score).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs to a main_champion" do
      expect(described_class.reflect_on_association(:main_champion).macro).to eq(:belongs_to)
    end
  end

  describe "Methods" do
    it "stores champion score" do
      championscore = ChampionScore.store_champion_scores(masteries, main)
      expect(championscore.count).to be == 2
    end
  end
end
