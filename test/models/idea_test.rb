require 'test_helper'

class IdeaTest < ActiveSupport::TestCase

  test 'changing the title' do
    idea = Idea.new
    idea.title = 'Learn how to program'
    idea.save!

    updated_at = idea.updated_at
    idea.title = 'Learn about Ruby on Rails'

    assert idea.save
    refute_equal idea.updated_at, updated_at
  end

  test 'removing the title' do
    idea = Idea.new
    idea.title = 'Learn how to program'
    idea.save!

    updated_at = idea.updated_at
    idea.title = ''

    assert idea.save
    refute_equal idea.updated_at, updated_at
  end

  test 'the first complete Idea created is the first in the list' do
    first_idea = Idea.new
    first_idea.title = 'Cycle the length of the United Kingdom'
    first_idea.photo_url = 'http://mybucketlist.ch/an_image.jpg'
    first_idea.done_count = 12
    first_idea.save!

    second_idea = Idea.new
    second_idea.title = 'Visit Japan'
    second_idea.photo_url = 'http://mybucketlist.ch/second_image.jpg'
    second_idea.done_count = 3
    second_idea.save!

    assert_equal(first_idea, Idea.all.first)
  end

  test 'edit idea' do
    idea = Idea.new
    idea.save!
    visit(edit_idea_path(idea))
    fill_in('title', with: 'Learn Ruby on Rails')
    click_on('Update')
    click_on('Learn Ruby on Rails')
    assert page.has_content?('Learn Ruby on Rails')

  end

end
