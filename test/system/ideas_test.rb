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
    click_on 'Update Profile'
    visit ideas_index_path
    assert page.has_content?('See the matterhorn')

  end
end
