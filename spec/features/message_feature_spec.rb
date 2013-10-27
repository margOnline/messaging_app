require 'spec_helper'

describe 'messages' do 
let(:user) {FactoryGirl.create(:email, :password, :password_confirmation, :no_credits)}
  context 'displays a form with a' do
    it 'mobile number field' do
      as_user(user).visit '/'
      expect(page).to have_field('message[phone]')
    end

    it 'body field' do
      as_user(user).visit '/'
      expect(page).to have_field('message[body]')
    end
  end

  context 'validates the form' do
    it 'phone field must filled in' do
      as_user(user).visit '/'
      fill_in 'message[body]', with: 'test message'
      click_button 'Send message'
      expect(page).to have_content 'Phone can\'t be blank'
    end

    it 'body field must be filled in' do
      as_user(user).visit '/'
      fill_in 'message[phone]', with: '123456789'
      click_button 'Send message'
      expect(page).to have_content 'Body can\'t be blank'
    end
  end
 
  it 'visitors will see a message to sign in or sign up' do
    as_visitor.visit '/'
    expect(page).to have_content('Sign in')
    expect(page).to have_content('Sign up')
    expect(page).to have_content 'You must be signed in to send a message.'
  end

  it 'displays the number of credits for an authenticated user' do
    as_user(user).visit '/'
    expect(page).to have_content
  end

  it 'displays a purchase credits button to authenticated users' do
    as_user(user).visit '/' 
    fill_in 'message[phone]', with: '+447545190929'
    fill_in 'message[body]', with: 'Hello'
    click_button 'Send message'
    expect(page).to have_content 'Message sent'
  end

  it 'displays messaging form to authenticated users with credits' do
    as_user(user).visit '/'
    expect(page).to have_field('message[phone]')
    expect(page).to have_field('message[body]')
    expect(page).to have_content 'You must be signed in to send a message.'
  end


end

