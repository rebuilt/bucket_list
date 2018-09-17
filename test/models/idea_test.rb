require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test 'the first empty Idea created is first in the list' do
    first_idea = Idea.new
    first_idea.title = 'first'
    first_idea.save!
    second_idea = Idea.new
    second_idea.title = 'second'
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

    refute idea.save
    assert_equal idea.updated_at, updated_at
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
    idea.title = 'title'
    idea.done_count = 46
    idea.save!
    first_updated_at = idea.updated_at
    idea.done_count = 184
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating photo_url' do
    idea = Idea.new
    idea.title = 'Swimming'
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

  test 'three idea records returned' do

    idea = Idea.new 
    idea.title = "First idea"
    idea.save!

    idea2 = Idea.new 
    idea2.title = "Second idea"
    idea2.save!
    idea3 = Idea.new 
    idea3.title = "Third idea"
    idea3.save!
    idea4 = Idea.new 
    idea4.title = "Fourth idea"
    idea4.save!
    idea5 = Idea.new 
    idea5.title = "Fifth idea"
    idea5.save!
    idea6 = Idea.new 
    idea6.title = "Sixth idea"
    idea6.save!

    recent_ideas = Idea.most_recent
    assert recent_ideas.length == 3

  end

  test 'create an idea with a title over the maximum allowed length' do
    idea = Idea.new
    idea.title = 'This is a title that is too long.  It is supposed to fail, so if it fails please understand that is what is supposed to happen.  Have a good day.  That is all.  Stop reading this now.  Go home.  Are you too good for your home?'
    refute idea.save
  end

  test 'ideas without titles are not valid' do
    idea = Idea.new
    refute idea.save

  end
end
