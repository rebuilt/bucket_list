require "application_system_test_case"

class ShowIdeasTest < ApplicationSystemTestCase

  test 'show displays title' do
    idea = Idea.new
    idea.title = "See the northern lights"
    idea.done_count = 3
    idea.photo_url =  "http://fpoimg.com/255x170"
    idea.save!

    visit(show_idea_path(idea))
    assert page.has_content?('See the northern lights')
    assert page.has_content?("#{3} have done this")
    assert page.has_content?("Created on #{idea.created_at.strftime("%d %b '%y'")}")
    # sleep(10.seconds)
    click_on 'Edit'
    assert current_path == edit_idea_path(idea)


  end
end
