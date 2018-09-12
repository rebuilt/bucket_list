require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test 'the first empty Idea created is first in the list' do
    first_idea = Idea.new
    first_idea.save!
    second_idea = Idea.new
    second_idea.save!
    assert_equal(first_idea, Idea.all.first)
  end

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

  test 'updated_at is changed after updating title' do
    idea = Idea.new
    idea.title = 'Visit Marrakech'
    idea.save!
    first_updated_at = idea.updated_at
    idea.title = 'Visit the market in Marrakech'
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating done_count' do
    idea = Idea.new
    idea.done_count = 46
    idea.save!
    first_updated_at = idea.updated_at
    idea.done_count = 184
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating photo_url' do
    idea = Idea.new
    idea.photo_url = '/images/swimmers.jpg'
    idea.save!
    first_updated_at = idea.updated_at
    idea.photo_url = '/images/runners.jpg'
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'one matching search result' do
    idea = Idea.new
    idea.title = "Stand at the top of the Empire State Building"
    idea.save!
    results = Idea.search("the top")
    assert results.length ==  1


  end

  test 'no matching search result' do
    idea = Idea.new
    idea.title = "Stand at the top of the Empire State Building"
    idea.save!
    results = Idea.search("snorkelling")
    assert_empty results
    assert results.length == 0
  end

  test 'two matching results' do
    idea = Idea.new
    idea.title = "Stand at the top of the Empire State Building"
    idea.save!
    idea2 = Idea.new
    idea2.title = "Stand on the pyramids"
    idea2.save!
    results = Idea.search("Stand")
    assert results.length ==  2
  end

  test 'no idea record exists' do
    ideas = Idea.most_recent
    assert ideas.empty?
  end
  
  test 'two idea records exist' do
    idea = Idea.new 
    idea.title = "First idea"
    idea.save!

    idea2 = Idea.new 
    idea2.title = "First idea"
    idea2.save!
    
    recent_ideas = Idea.most_recent
    assert recent_ideas.length == 2

  end

end
