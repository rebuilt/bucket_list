require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit home_pages_url
  #
  #   assert_selector "h1", text: "HomePage"
  # end
  test 'Create ideas and display most_recent' do
    
    idea = Idea.new 
    idea.title = "First idea"
    idea.user = User.new
    idea.save!

    idea2 = Idea.new 
    idea2.title = "Second idea"
    idea2.user = User.new
    idea2.save!
    idea3 = Idea.new 
    idea3.title = "Third idea"
    idea3.user = User.new
    idea3.save!
    idea4 = Idea.new 
    idea4.title = "Fourth idea"
    idea4.user = User.new
    idea4.save!

    visit(root_path)
    assert has_content? "Second idea"
    assert has_content? "Third idea"
    assert has_content? "Fourth idea"

    refute has_content? "First idea"
    
  end
end
