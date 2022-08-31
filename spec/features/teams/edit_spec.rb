require 'rails_helper'

RSpec.describe 'edit team feature' do
  describe 'As a visitor when I visit /teams/:id' do
    describe 'I click the edit team button' do
      before(:each) do
        @rays = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
      end

      xit 'links to the edit page' do

        visit "teams/#{@rays.id}"
        save_and_open_page
        click_button "Edit Team"

        expect(current_path).to eq("/teams/#{rays.id}/edit")
      end

      xit 'has a form to define the attributes to update' do

        visit "/teams/#{@rays.id}/edit"

        expect(page).to have_field(:team_name)
        expect(page).to have_field(:city)
        expect(page).to have_field(:win_percent)
        expect(page).to have_field(:division_leader)
        expect(page).to have_button("Update #{@rays.team_name}")
      end

      xit 'can update the team' do
        visit "teams/#{@rays.id}/update"

          fill_in(:team_name, with: 'Rays')
          fill_in(:city, with: 'Tampa Bay')
          fill_in(:win_percent, with: 0.618)
          click_on(:division_leader, with: true)

          expect(@rays.team_name).to eq('Rays')
          expect(@rays.city).to eq('Tampa Bay')
          expect(@rays.win_percent).to eq(0.618)
          expect(page.current_path).to eq("/teams/#{@rays.id}")
      end
    end
  end
end

