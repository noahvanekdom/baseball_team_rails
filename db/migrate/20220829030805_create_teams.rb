class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :city
      t.string :team_name
      t.float :win_percent
      t.boolean :division_leader

      t.timestamps
    end
  end
end
