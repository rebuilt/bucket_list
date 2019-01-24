require 'application_system_test_case'

class IdeaCommentsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit idea_comments_url
  #
  #   assert_selector "h1", text: "IdeaComment"
  # end
  test 'adding a comment to and idea' do
    user = User.new email: 'test@epfl.ch'
    user.save!

    idea = Idea.new title: 'Volunteer for a charity', user: user
    idea.save

    visit(new_user_path)
    fill_in('Email', with: user.email)
    click_on('Log in')

    visit(idea_path(idea))
    fill_in('Add a comment', with: 'This is a fantastic idea!')
    click_on('Post', match: :first)
    assert_equal idea_path(idea), page.current_path
    assert page.has_content?('This is a fantastic idea!')
  end

  test 'comments cannot be added when not logged in' do
    idea = Idea.new title: 'Try archery', user: User.new
    idea.save!

    visit(idea_path(idea))
    refute page.has_content?('Add a comment')
  end
end
