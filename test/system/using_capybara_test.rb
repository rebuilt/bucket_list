require 'application_system_test_case'

Capybara.run_server = false


class CapybaraTest < ApplicationSystemTestCase
  driven_by :selenium, using: :firefox

  test 'capybara works' do
    visit('http://www.google.com')
    sleep(1.seconds)
    fill_in('q', with: 'Cinque Terre')
    sleep(1.seconds)
    click_on('Search', match: :first)
    click_on('Wikipedia', match: :first)
    sleep(1.seconds)
    click_on('Italian Riviera', match: :first)
    sleep(20.seconds)
  end
end
