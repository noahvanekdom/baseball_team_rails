require 'rails_helper'

RSpec.describe 'edit team feature' do
  describe 'As a visitor when I visit /teams/:id' do
    describe 'I click the edit team button' do
      before :each do
        # ActiveRecord::Base.connection.schema_cache.clear!
      end


      it 'links to the edit page' do
        team = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)

        visit "teams/#{team.id}"
        click_link "Edit Team"

        expect(current_path).to eq("/teams/#{team.id}/edit")
      end

      it 'has a form to define the attributes to update' do
        team = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
        visit "/teams/#{team.id}/edit"

        expect(page).to have_field(:team_name)
        expect(page).to have_field(:city)
        expect(page).to have_field(:win_percent)
        expect(page).to have_field(:division_leader)
        expect(page).to have_link("Update #{team.team_name}")
      end

      it 'can update the team' do
        team = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
        visit "teams/#{team.id}/edit"

        fill_in(:team_name, with: 'Rays')
        fill_in(:city, with: 'Tampa Bay')
        fill_in(:win_percent, with: 0.618)
        fill_in(:division_leader, with: true)

        expect(team.team_name).to eq('Rays')
        expect(team.city).to eq('Tampa Bay')
        expect(team.win_percent).to eq(0.618)
        expect(page.current_path).to eq("/teams/#{team.id}")
      end
    end
  end
end

