class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.float :slg
      t.float :obp
      t.boolean :rule_5_elig
      t.string :handed

      t.timestamps
    end
  end
end
