require 'spec_helper'

describe 'messages' do 

  context 'displays a form with a' do

    it 'mobile number field' do
      visit '/'
      expect(page).to have_field('number')
    end

    it 'message form' do
      visit '/'
      expect(page).to have_field('number')
    end
  end

  
end