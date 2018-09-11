require "application_system_test_case"

class SearchesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit searches_url
  #
  #   assert_selector "h1", text: "Search"
  # end

  test 'create record and search for it' do
    idea = Idea.new
    idea.title = "Climb Mont Blanc"
    idea.save!
    idea2 = Idea.new
    idea2.title = "Visit Niagra Falls"
    idea2.save!

    visit root_path
    fill_in 'q', with: 'Mont'
    click_on  'Search' , match: :first
      sleep(4.seconds)
     assert current_path == ideas_index_path 
       sleep(4.seconds)
      assert page.has_content?("Climb Mont Blanc")
       sleep(4.seconds)
        refute page.has_content?("Visit Niagra Falls")
    

    
  end
end
