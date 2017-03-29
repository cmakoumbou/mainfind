class RiotApi
  BASE_URL = "https://euw.api.pvp.net"
  GLOBAL_URL = "https://global.api.riotgames.com"

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

  def get_mastery_points(summonerid)
    mastery_points_url = "#{BASE_URL}/championmastery/location/EUW1/player/#{summonerid}/champions?api_key=#{RIOT_API_KEY}"
    get_response(mastery_points_url)
  end

  def get_top_champion(summonerid)
    top_champion_url = "#{BASE_URL}/championmastery/location/EUW1/player/#{summonerid}/topchampions?count=1&api_key=#{RIOT_API_KEY}"
    get_response(top_champion_url)
  end

  def get_all_champions
    get_all_champions_url = "#{GLOBAL_URL}/api/lol/static-data/EUW/v1.2/champion?dataById=true&api_key=#{RIOT_API_KEY}"
    get_response(get_all_champions_url)
  end
end
