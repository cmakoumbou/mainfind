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

FactoryGirl.define do
  factory :player do
    summonerid "39777270"
    name "Batman"
    tier "Challenger"
  end
end
