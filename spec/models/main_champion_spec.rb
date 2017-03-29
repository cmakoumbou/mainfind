# == Schema Information
#
# Table name: main_champions
#
#  id         :integer          not null, primary key
#  championid :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe MainChampion, type: :model do

  main_champion = FactoryGirl.create(:main_champion)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(main_champion).to be_valid
    end

    it "is not valid without a championid" do
      main_champion.championid = nil
      expect(main_champion).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many champion_score" do
      expect(described_class.reflect_on_association(:champion_score).macro).to eq(:has_many)
    end
  end
end
