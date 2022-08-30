require 'rails_helper'

describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :players }
  end

  describe 'sorting' do

    #RETURN TO THIS TEST
    it 'sorts by order of creation' do
      ###expect book.last.created_on to be > book.first.created_on
    end
  end

end