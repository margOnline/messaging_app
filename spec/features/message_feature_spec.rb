require 'spec_helper'

describe 'messages' do 

  it 'visitors will see a message to sign in or sign up' do
    visit '/'
    expect(page).to have_content('Sign in')
    expect(page).to have_content('Sign up')
    expect(page).to have_content 'You must be signed in and have credits to send a message'
  end

  it 'signs up new users with 0 credits' do
    visit '/'
    click_link 'Sign up'
    fill_in 'user[email]', with: 'mary@gmail.com'
    fill_in 'user[password]', with: 'secret123'
    fill_in 'user[password_confirmation]', with: 'secret123'
    click_button 'Sign up'
    expect(user.last.credits).to eq 0
  end

  it 'does not allow users with 0 credits to send message' do
    user = FactoryGirl.create(:user, :no_credits)
    visit '/'
    expect(page).to have_content 'You must be signed in and have credits to send a message'
  end

  context 'with a logged in user' do

    before(:each) do
      user = FactoryGirl.create(:user, :with_credits)
      login_as(user, :scope => :user)
    end
    
    context 'displays to logged in users a form with a' do

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

    context 'validates the form' do

      it 'displays the number of credits for an authenticated user' do
        visit '/'
        expect(page).to have_content 'Credits: 5'
      end

      it 'displays a purchase credits button to authenticated users' do
        visit '/' 
        expect(page).to have_content 'Buy Credits'
      end
    
    end
  end
end

