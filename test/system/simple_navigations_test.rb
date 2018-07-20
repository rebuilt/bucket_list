require "application_system_test_case"

class SimpleNavigationsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit simple_navigations_url
  #
  #   assert_selector "h1", text: "SimpleNavigation"
  # end
  test 'search term is displayed' do
    visit('/')
    assert page.has_content?('Bucket List')
     fill_in('q', with: 'Spain').send_keys(:enter)
     assert has_content?('Spain')
     assert current_url.include?('q=Spain')
  end

  test 'style guide navigation' do
     visit('/')
     click_on('Style Guide')
     sleep(1.second)
     assert current_url.include?('/styles/atoms')
     sleep(8.second)
     assert has_content?('Atoms')
     assert has_content?('Molecules')
  end
end
