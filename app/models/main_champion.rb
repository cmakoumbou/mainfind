# == Schema Information
#
# Table name: main_champions
#
#  id         :integer          not null, primary key
#  championid :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MainChampion < ApplicationRecord
  has_many :champion_score
  validates_presence_of :championid
end
