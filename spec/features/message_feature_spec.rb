require 'spec_helper'

describe 'messages' do 

  context 'displays a form with a' do

    it 'mobile number field' do
      visit '/'
      expect(page).to have_field('phone')
    end

    it 'body field' do
      visit '/'
      expect(page).to have_field('body')
    end
  end

  
end