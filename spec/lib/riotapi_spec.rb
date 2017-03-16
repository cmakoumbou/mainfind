require 'dotenv/load'
require 'spec_helper'
require 'riotapi'
require 'rest-client'

describe 'Riot Api' do
  it "gets the challenger league" do
    client = RiotApi.new

    response = client.get_challenger_league

    expect(response.code).to eq(200)
  end
end
