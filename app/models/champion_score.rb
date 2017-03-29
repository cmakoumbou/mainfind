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

class ChampionScore < ApplicationRecord
  belongs_to :main_champion
  validates_presence_of :points, :championid
end
