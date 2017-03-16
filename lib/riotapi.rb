class RiotApi
  BASE_URL = "https://euw.api.pvp.net"
  RIOT_API_KEY = ENV['RIOT_API_KEY']

  def get_response(url)
    response = RestClient.get(url)
    JSON.parse(response)
  end

  def get_challenger_league
    challenger_league_url = "#{BASE_URL}/api/lol/EUW/v2.5/league/challenger?type=RANKED_SOLO_5x5&api_key=#{RIOT_API_KEY}"
    get_response(challenger_league_url)
  end

  def get_master_league
    master_league_url = "#{BASE_URL}/api/lol/EUW/v2.5/league/master?type=RANKED_SOLO_5x5&api_key=#{RIOT_API_KEY}"
    get_response(master_league_url)
  end
end
