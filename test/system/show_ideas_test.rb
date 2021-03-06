require 'application_system_test_case'

class ShowIdeasTest < ApplicationSystemTestCase
  test 'show displays title' do
    visit(new_user_path)
    fill_in('Email', with: 'me@epfl.ch')
    fill_in('Password', with: '123')
    within find('.new_user') do
      click_on('Sign up')
    end
    idea = Idea.new
    idea.title = 'See the northern lights'
    idea.done_count = 3
    idea.photo_url =  'http://fpoimg.com/255x170'
    idea.user = User.find_by(email: 'me@epfl.ch')
    idea.save!

    visit(idea_path(idea))
    assert page.has_content?('See the northern lights')
    assert page.has_content?("#{idea.done_count} have done this")
    assert page.has_content?("Created on #{idea.created_at.strftime("%d %b '%y")}")
    # sleep(10.seconds)
    click_on 'Edit'
    assert current_path == edit_idea_path(idea)
  end
end
