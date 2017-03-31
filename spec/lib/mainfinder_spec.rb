require 'mainfinder'

describe 'Main finder' do
  it "stores champion scores for all the main champions" do
    FactoryGirl.create(:main_champion, championid: "25")
    FactoryGirl.create(:main_champion, championid: "30")

    # Player 1
    main_player = FactoryGirl.create(:player, topchampionid: "25")
    FactoryGirl.create(:champion_mastery, player: main_player, championid: "25", points: "200")
    FactoryGirl.create(:champion_mastery, player: main_player, championid: "55", points: "100")
    FactoryGirl.create(:champion_mastery, player: main_player, championid: "80", points: "50")

    # Player 2
    main_player2 = FactoryGirl.create(:player, topchampionid: "30")
    FactoryGirl.create(:champion_mastery, player: main_player2, championid: "30", points: "300")
    FactoryGirl.create(:champion_mastery, player: main_player2, championid: "50", points: "200")
    FactoryGirl.create(:champion_mastery, player: main_player2, championid: "75", points: "100")

    # Player 3
    main_player3 = FactoryGirl.create(:player, topchampionid: "30")
    FactoryGirl.create(:champion_mastery, player: main_player3, championid: "30", points: "700")
    FactoryGirl.create(:champion_mastery, player: main_player3, championid: "50", points: "300")
    FactoryGirl.create(:champion_mastery, player: main_player3, championid: "75", points: "200")

    client = MainFinder.new
    results = client.store_all_champions_scores
    expect(ChampionScore.count).to eq(4)
    expect(ChampionScore.find_by(championid: "75").points).to eq(300)
  end
end
