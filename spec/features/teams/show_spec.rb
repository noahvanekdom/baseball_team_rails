require 'rails_helper'

RSpec.describe 'Teams show page' do
  describe 'As a visitor' do
    describe 'when I visit "/teams/:id"' do
      describe 'I see the team with that id including the team attributes:' do
        before :each do
          @team = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
        end

        it 'displays the team name' do

          visit "/teams/#{@team.id}"
          expect(page).to have_content(@team.team_name)
        end

        it 'displays the city' do

          visit "/teams/#{@team.id}"
          expect(page).to have_content(@team.city)
        end

        it 'displays the win percent' do

          visit "/teams/#{@team.id}"
          expect(page).to have_content(@team.win_percent)
        end

        it 'displays if it is a division leader' do

          visit "/teams/#{@team.id}"
          expect(page).to have_content(@team.division_leader)
        end


        it 'displays the created at timestamp' do

          visit "/teams/#{@team.id}"
          expect(page).to have_content(@team.created_at)
        end

        it 'displays the updated at timestamp' do

          visit "/teams/#{@team.id}"
          expect(page).to have_content(@team.updated_at)
        end

        it 'displays the player count of the team' do

          visit "/teams/#{@team.id}"
          expect(page).to have_content(@team.player_count)
        end
      end

      describe "page links" do
        before :each do
          @team = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
        end
        it 'has a link to team index' do
          visit "/teams/#{@team.id}"
          click_link "Teams"

          expect(current_path).to eq("/teams")
        end
        it 'has a link to the players index' do
          visit "/teams/#{@team.id}"
          click_link "Players"

          expect(current_path).to eq("/players")
        end
        it 'has a link to the players on the team' do
          visit "/teams/#{@team.id}"
          click_link "Players on the #{@team.team_name}"

          expect(current_path).to eq("/teams/#{@team.id}/players")
        end
      end
    end
  end
end