require 'spec_helper'

describe 'messages' do 

  context 'displays a form with a' do
    it 'mobile number field' do
      visit '/'
      expect(page).to have_field('message[phone]')
    end

    it 'body field' do
      visit '/'
      expect(page).to have_field('message[body]')
    end
  end

  context 'validates the form' do
    it 'phone field must filled in' do
      visit '/'
      fill_in 'message[body]', with: 'test message'
      click_button 'Send message'
      expect(page).to have_content 'Phone can\'t be blank'
    end

    it 'body field must be filled in' do
      visit '/'
      fill_in 'message[phone]', with: '123456789'
      click_button 'Send message'
      expect(page).to have_content 'Body can\'t be blank'
    end
  end
 
  it 'sends a message' do
    visit '/' 
    fill_in 'message[phone]', with: '123456789'
    fill_in 'message[body]', with: 'Hello'
    click_button 'Send message'
    expect(page).to have_content 'Message sent'
  end

end

