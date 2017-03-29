class CreateMainChampions < ActiveRecord::Migration[5.0]
  def change
    create_table :main_champions do |t|
      t.string :championid

      t.timestamps
    end
  end
end
