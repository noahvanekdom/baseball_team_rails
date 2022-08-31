require 'rails_helper'

RSpec.describe 'Player creation' do
  describe 'when I visit the teams show page' do
      # cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)

      # nolan = cardinals.players.create!(name: "Nolan Arenado", slg: 0.547, obp: 0.419, rule_5_elig: true, handed: "L")


    it 'has a link to create a new player' do
      visit "/teams/#{cardinals.id}/players"
      click_link("New Player")

      expect(current_path).to eq("/teams/#{@cardinals.id}/players")
    end

    it 'has a form for creating a new player' do
      cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)

      nolan = @cardinals.players.create!(name: "Nolan Arenado", slg: 0.547, obp: 0.419, rule_5_elig: true, handed: "L")

      visit "/teams/#{cardinals.id}/players/new"

      expect(page).to have_field(:name)
      expect(page).to have_field(:obp)
      expect(page).to have_field(:slg)
      expect(page).to have_field(:rule_5_elig)
      expect(page).to have_field(:handed)
    end

    it 'can create a new player' do
      cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)

      nolan = @cardinals.players.create!(name: "Nolan Arenado", slg: 0.547, obp: 0.419, rule_5_elig: true, handed: "L")
      visit "/teams/#{cardinals.id}/players/new"

      fill_in('team_name', with: 'Nationals')
      fill_in('city', with: 'Washington')
      fill_in('win_percent', with: 0.001)
      fill_in('division_leader', with: false)
      click_button('Create Team')

      expect(current_path).to eq('/teams')
      expect(page).to have_content('Washington Nationals')
    end
  end
end
