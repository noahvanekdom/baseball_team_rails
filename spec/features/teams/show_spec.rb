require 'rails_helper'

RSpec.describe 'Teams show page' do
  describe 'As a visitor' do
    describe 'when I visit "/teams/:id"' do
      describe 'I see the team with that id including the team attributes:' do
        before(:each) do
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
      end
    end
  end
end