require "application_system_test_case"

class SimpleNavigationsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit simple_navigations_url
  #
  #   assert_selector "h1", text: "SimpleNavigation"
  # end

  test 'style guide navigation' do
     visit('/')
     click_on('Style Guide')
     # sleep(1.seconds)
     assert current_url.include?('/styles/atoms')
      # sleep(1.seconds)
     assert has_content?('Atoms')
     assert has_content?('Molecules')
     # sleep(5.seconds)
     click_on('Molecules', match: :first)
     assert current_url.include?('/styles/molecules')
     assert has_content?('Card')
      click_on('My Bucket List', match: :first)
      assert current_path ==  root_path
      # sleep(10.seconds)
    #expect(page).to have_current_path(root_path)
    assert has_content?('Some ideas')


  end
end
