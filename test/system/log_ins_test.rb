require 'application_system_test_case'

class LogInsTest < ApplicationSystemTestCase
  test 'sign up creates a User' do
    visit(new_user_path)
    fill_in('Email', with: 'new@epfl.ch')
    click_on('Log in')
    assert_equal 1, User.all.length
    assert_equal 'new@epfl.ch', User.first.email
  end

  test 'Create and save a User with an email address' do
    user = User.new email: 'me@epfl.com'
    visit(new_user_path)
    fill_in('Email', with: 'me@epfl.com')
    click_on('Log in')
    assert_equal 1, User.all.length
  end
end
