class AddDetailsToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :name, :string
    add_column :players, :tier, :string
  end
end
