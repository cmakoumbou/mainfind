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
end
