require 'application_system_test_case'

class IdeasTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit ideas_url
  #
  #   assert_selector "h1", text: "Ideas"
  # end
  test 'create new idea' do
    createUserAndLogIn
    visit new_idea_path
    fill_in 'Title', with: 'See the matterhorn'
    fill_in 'Done count', with: '3'
    fill_in 'Photo url', with: 'https://cdn.shopify.com/s/files/1/0871/3066/products/FJ-1019-CappuccinoCup190ml-Feijoa-Cropped_1024x1024.jpg?v=1524591768'
    # sleep(10.seconds)
    click_on 'Create Idea'
    visit ideas_path
    assert page.has_content?('See the matterhorn')
    # sleep(10.seconds)
  end

  test 'create two ideas records' do
    createUserAndLogIn
    first_idea = Idea.new title: 'Cycle across Australia',
                     done_count: 2,
                     photo_url: 'https://cdn.shopify.com/s/files/1/0871/3066/products/FJ-1019-CappuccinoCup190ml-Feijoa-Cropped_1024x1024.jpg?v=1524591768',
                     user: User.find(1)
    first_idea.save!

    second_idea = Idea.new title: 'Road rage championship',
                     done_count: 2,
                     photo_url: 'https://i.ytimg.com/vi/qvE2miLMbNk/maxresdefault.jpg',
                     user: User.find(1)
    second_idea.save!

    visit ideas_path
    assert page.has_content?('Cycle across Australia')
    assert page.has_content?('Road rage championship')
    assert_equal 2, page.all('.card').count
    # sleep(10.seconds)
  end

  test 'create idea and visit page to edit that idea' do
    createUserAndLogIn
    idea = Idea.new title: 'See the alps',
                    done_count: 3,
                    photo_url: 'https://i.ytimg.com/vi/qvE2miLMbNk/maxresdefault.jpg',
                    user: User.find(1)
    idea.save!

    visit edit_idea_path(idea)
    fill_in 'Done count', with: 10
    fill_in 'Title', with: 'Travel to Zermatt'
    click_on 'Update'

    # sleep(4.seconds)
    assert page.has_content?('Travel to Zermatt')
    assert page.has_content?('10 have done this.')
  end

  test 'edit idea' do
    createUserAndLogIn
    idea = Idea.new title: 'Test idea',
                    user: User.find(1)
    idea.save!
    visit(edit_idea_path(idea))
    fill_in('Done count', with: 73)
    fill_in('Title', with: 'Learn Ruby on Rails')
    click_on('Update')
    click_on('Learn Ruby on Rails')
    assert page.has_content?('Learn Ruby on Rails')
    assert page.has_content?('73 have done this')
    refute page.has_content?('Test idea')
  end

  test 'no search results' do
    createUserAndLogIn
    visit(ideas_path)
    assert page.has_content?('No ideas found!')
  end

  test 'new idea with no title' do
    createUserAndLogIn
    visit(new_idea_path)
    fill_in('Done count', with: 232)
    click_on('Create Idea')
    assert page.has_content?("Title can't be blank")
  end

  test 'new idea title is too long' do
    createUserAndLogIn
    visit(new_idea_path)
    fill_in('Title', with: "This is a title that is too long because it goes on and on and on.  Don't think this will save properly, it will give a message about it being too long.")
    click_on('Create Idea')
    assert page.has_content?('Title is too long')
  end

  test 'existing idea updated with no title' do
    idea = Idea.new(title: 'Exciting idea!', user: User.new)
    idea.save!
    visit(edit_idea_path(idea))
    fill_in('Title', with: '')
    click_on('Update Idea')
    assert page.has_content?("Title can't be blank")
  end

  def createUserAndLogIn
    visit(new_user_path)
    fill_in('Email', with: 'me@mail.com')
    fill_in('Password', with: '123')
    click_on('Log in')
  end
end
