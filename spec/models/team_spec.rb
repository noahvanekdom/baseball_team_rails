require 'rails_helper'

describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :players }
  end

  describe 'sorting' do
    it 'sorts by order of creation' do
    end
  end
end