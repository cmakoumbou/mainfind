class MainFinder
  def store_all_champions_scores
    MainChampion.all.each do |main|
      champion = main.championid
      players = Player.where(topchampionid: champion)
      players.each do |player|
        masteries = ChampionMastery.exclude_top_champion(player)
        ChampionScore.store_champion_scores(masteries, main)
      end
    end
  end
end
