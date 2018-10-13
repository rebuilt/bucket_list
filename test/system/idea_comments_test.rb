require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit idea_comments_url
  #
  #   assert_selector "h1", text: "IdeaComment"
  # end
  test 'adding a comment to and idea' do 
    idea = Idea.new title: 'Volunteer for a charity'
    idea.save
    visit(idea_path(idea))
    fill_in('Add a comment', with: 'This is a fantastic idea!')
    click_on('Post', match: :first)
    assert_equal idea_path(idea), page.current_path

  end
end
