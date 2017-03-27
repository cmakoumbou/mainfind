class AddTopchampionidToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :topchampionid, :string
  end
end
