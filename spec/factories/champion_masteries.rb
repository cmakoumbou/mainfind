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

FactoryGirl.define do
  factory :champion_mastery do
    points 200
    championid "12"
    player
  end
end
