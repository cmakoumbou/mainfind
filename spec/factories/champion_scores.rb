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

FactoryGirl.define do
  factory :champion_score do
    points 100
    championid "1"
    main_champion
  end
end
