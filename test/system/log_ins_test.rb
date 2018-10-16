require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase
  test 'sign up creates a User' do
    deleteFixtures
    visit(new_user_path)
    fill_in('Email', with: 'new@epfl.ch')
    click_on('Log in')
    # assert_equal 1, User.all.length
    assert_equal  'new@epfl.ch', User.first.email

  end


  test 'Create and save a User with an email address' do
    deleteFixtures
    user = User.new  email: "me@epfl.com"
    visit(new_user_path)
    fill_in("Email", with: "me@epfl.com")
    click_on('Log in')
    assert_equal 1, User.all.length
  end

  def deleteFixtures
    users = User.all
    users.each do  |user|
      puts user.email
    end
    User.first.delete
    User.first.delete

  end
end
