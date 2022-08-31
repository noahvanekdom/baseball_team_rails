require 'rails_helper'

RSpec.describe 'Team creation' do
  it 'has a link to create a new team' do
    visit "/teams"

    click_link("New Team")

    expect(current_path).to eq("/teams/new")
  end

  it 'has a form for creating a new team' do
    visit "/teams/new/"

    expect(page).to have_field(:city)
    expect(page).to have_field(:team_name)
    expect(page).to have_field(:win_percent)
    expect(page).to have_field(:division_leader)
  end


  it 'can create a new team' do
    visit '/teams/new'

    fill_in('team_name', with: 'Nationals')
    fill_in('city', with: 'Washington')
    fill_in('win_percent', with: 0.001)
    fill_in('division_leader', with: false)
    click_button('Create Team')

    expect(current_path).to eq('/teams')
    expect(page).to have_content('Washington Nationals')
  end
end