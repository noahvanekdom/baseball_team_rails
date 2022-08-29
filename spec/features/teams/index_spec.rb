require 'rails_helper'

RSpec.describe 'Teams index page' do
  describe 'As a visitor' do
    describe 'when I visit "/teams"' do
      describe "I see the name of each teams record in the system" do

        before(:each) do
        end


        xit 'displays the city of the team' do

          visit "/teams"

          expect(page).to have_content(team1.city)
          expect(page).to have_content(team2.city)

        end

        xit 'displays the name of the team' do
        end

      end
    end
  end
end