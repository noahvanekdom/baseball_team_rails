require 'rails_helper'

RSpec.describe 'Players index page' do
  describe 'As a visitor' do
    describe 'when I visit "/players"' do
      describe "I see the name of each players record in the system" do

        before(:each) do
          @rays = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
          @cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)

          @nolan = @cardinals.players.create!(name: "Nolan Arenado", slg: 0.547, obp: 0.419, rule_5_elig: true, handed: "L")
          @paul = @cardinals.players.create!(name: "Paul Goldschmidt", slg: 0.594, obp: 0.400, rule_5_elig: false, handed: "L")
          @shane = @rays.players.create!(name: "Shane Bas", slg: 0.198, obp: 0.209, rule_5_elig: true, handed: "R")
        end


        it 'displays the names of players' do

          visit "/players"

          expect(page).to have_content(@nolan.name)
          expect(page).to have_content(@paul.name)

        end

        it 'displays the attributes of players' do

          visit "/players"

          expect(page).to have_content(@nolan.obp)
          expect(page).to have_content(@paul.obp)
          expect(page).to have_content(@paul.slg)
          expect(page).to have_content(@nolan.slg)

          expect(page).to have_content(@paul.handed)
          expect(page).to have_content(@nolan.rule_5_elig)
        end

      end
    end
  end
end