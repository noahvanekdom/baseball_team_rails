require 'rails_helper'

RSpec.describe 'Teams index page' do
  describe 'As a visitor' do
    describe 'when I visit "/teams"' do
      describe "I see the name of each teams record in the system" do

        before(:each) do
          @rays = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
          @cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)
        end

        it 'displays the city of the team' do

          visit "/teams"

          expect(page).to have_content(@rays.city)
          expect(page).to have_content(@cardinals.city)

        end

        it 'displays the name of the team' do

          visit "/teams"

          expect(page).to have_content(@rays.team_name)
          expect(page).to have_content(@cardinals.team_name)
        end
      end

      describe "page links" do
        before(:each) do
        end
        it 'has a link to team index' do
          visit "/teams"
          click_link "Teams"

          expect(current_path).to eq("/teams")
        end
        it 'has a link to the players index' do
          visit "/teams"
          click_link "Players"

          expect(current_path).to eq("/players")
        end
      end
    end
  end
end