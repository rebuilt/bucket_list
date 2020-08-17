require 'application_system_test_case'

class LogInsTest < ApplicationSystemTestCase
  test 'sign up creates a User' do
    visit(new_user_path)
    fill_in('Email', with: 'new@epfl.ch')
    fill_in('Password', with: '123')
    within find('#new_user') do
      click_on('Sign up')
    end
    assert_equal 1, User.all.length
    assert_equal 'new@epfl.ch', User.first.email
  end
end
