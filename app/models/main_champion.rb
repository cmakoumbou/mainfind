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
  has_many :champion_score, dependent: :destroy
  validates_presence_of :championid

  def self.store_all_champions
    client = RiotApi.new
    response = client.get_all_champions
    response["data"].each do |x|
      MainChampion.create(championid: x[0])
    end
  end
end
