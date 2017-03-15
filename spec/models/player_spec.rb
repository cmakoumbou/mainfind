# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  summonerid :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Player, type: :model do
  # it "gets challenger players data" do
  #   response = RestClient.get "https://euw.api.pvp.net/api/lol/EUW/v2.5/league/challenger?type=RANKED_SOLO_5x5&api_key=#{RIOT_API_KEY}"
  #   expect(response.code).to eq(200)
  # end
end
