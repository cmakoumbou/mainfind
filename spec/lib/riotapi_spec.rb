require 'dotenv/load'
require 'spec_helper'
require 'riotapi'
require 'rest-client'
require 'vcr_setup'

describe 'Riot Api' do
  it "gets the challenger league" do
    VCR.use_cassette('riotapi/get_challenger_league') do
      client = RiotApi.new
      response = client.get_challenger_league
      expect(response['tier']).to eq('CHALLENGER')
    end
  end

  it "gets the master league" do
    VCR.use_cassette('riotapi/get_master_league') do
      client = RiotApi.new
      response = client.get_master_league
      expect(response['tier']).to eq('MASTER')
    end
  end

  it "gets mastery points" do
    VCR.use_cassette('riotapi/get_mastery_points') do
      client = RiotApi.new
      summonerid = "39777270"
      response = client.get_mastery_points(summonerid)
      expect(response.first['playerId']).to eq(39777270)
    end
  end

  it "gets the top champion mastery entry for a player" do
    VCR.use_cassette('riotapi/get_top_champion') do
      client = RiotApi.new
      summonerid = "39777270"
      response = client.get_top_champion(summonerid)
      expect(response.first['playerId']).to eq(39777270)
    end
  end
end
