require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit ideas_url
  #
  #   assert_selector "h1", text: "Ideas"
  # end
  test 'create new idea' do

    visit ideas_new_path
    fill_in 'title', with: 'See the matterhorn'
    fill_in 'done_count', with: "3"
    fill_in 'photo_url', with: "https://cdn.shopify.com/s/files/1/0871/3066/products/FJ-1019-CappuccinoCup190ml-Feijoa-Cropped_1024x1024.jpg?v=1524591768"
    # sleep(10.seconds)
    click_on 'Update Profile'
    visit ideas_index_path
    assert page.has_content?('See the matterhorn')
    # sleep(10.seconds)

  end

  test 'create two ideas records' do
    idea1 = Idea.new
    idea1.title = "Cycle across Australia"
    idea1.done_count = 2
    idea1.photo_url = "https://cdn.shopify.com/s/files/1/0871/3066/products/FJ-1019-CappuccinoCup190ml-Feijoa-Cropped_1024x1024.jpg?v=1524591768"
    idea1.save!

    idea2 = Idea.new
    idea2.title = "Road rage championship"
    idea2.done_count = 2
    idea2.photo_url = "https://i.ytimg.com/vi/qvE2miLMbNk/maxresdefault.jpg"
    idea2.save!
    
    visit ideas_index_path 
    assert page.has_content?("Cycle across Australia")
    assert page.has_content?("Road rage championship")
    assert_equal 2, page.all('.card').count
    #sleep(10.seconds)

  end

  test 'create idea and visit page to edit that idea' do
    idea = Idea.new
    idea.title = 'See the alps'
    idea.done_count = 3
    idea.photo_url = "https://i.ytimg.com/vi/qvE2miLMbNk/maxresdefault.jpg"
    idea.save!

    visit edit_idea_path(idea)
    fill_in 'done_count', with: 10
    fill_in 'title', with: 'Travel to Zermatt'
    click_on 'Update'

    sleep(4.seconds)
    assert page.has_content?('Travel to Zermatt')
    assert page.has_content?('10 have done this.')
  end
  
end

