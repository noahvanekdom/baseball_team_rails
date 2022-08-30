require 'rails_helper'

RSpec.describe 'players show page' do
  describe 'As a visitor' do
    describe 'when I visit "/players/:id"' do
      describe 'I see the player with that id including the player attributes:' do
        before(:each) do
          @cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)
          @player = @cardinals.players.create!(name: "Nolan Arenado", slg: 0.547, obp: 0.419, rule_5_elig: true, handed: "L")
        end

        it 'displays the player name' do

          visit "/players/#{@player.id}"
          expect(page).to have_content(@player.name)
        end

        it 'displays the handedness of the player' do

          visit "/players/#{@player.id}"
          expect(page).to have_content(@player.handed)
        end

        it 'displays the slugging percentage' do

          visit "/players/#{@player.id}"
          expect(page).to have_content(@player.slg)
        end

        it 'displays the on base percentage' do

          visit "/players/#{@player.id}"
          expect(page).to have_content(@player.obp)
        end

        it 'displays the rule 5 draft eligibility of the player' do

          visit "/players/#{@player.id}"
          expect(page).to have_content(@player.rule_5_elig)
        end


        it 'displays the created at timestamp' do

          visit "/players/#{@player.id}"
          expect(page).to have_content(@player.created_at)
        end

        it 'displays the updated at timestamp' do

          visit "/players/#{@player.id}"
          expect(page).to have_content(@player.updated_at)
        end
      end

      describe "page links" do
        before(:each) do
          @cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)
          @player = @cardinals.players.create!(name: "Nolan Arenado", slg: 0.547, obp: 0.419, rule_5_elig: true, handed: "L")
        end
        it 'has a link to team index' do
          visit "/players/#{@player.id}"
          click_link "Teams"

          expect(current_path).to eq("/teams")
        end
        it 'has a link to the players index' do
          visit "/players/#{@player.id}"
          click_link "Players"

          expect(current_path).to eq("/players")
        end
      end
    end
  end
end