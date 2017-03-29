# == Schema Information
#
# Table name: main_champions
#
#  id         :integer          not null, primary key
#  championid :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :main_champion do
    championid "1"
  end
end
