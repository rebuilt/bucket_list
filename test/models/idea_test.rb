require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test 'the first empty Idea created is first in the list' do
    first_idea = Idea.new title: 'first',
                          user: User.new
    first_idea.save!
    second_idea = Idea.new title: 'second',
                           user: User.new
    second_idea.save!
    assert_equal(first_idea, Idea.all.first)
  end

  test 'changing the title' do
    idea = Idea.new title: 'Learn how to program',
                    user: User.new
    idea.save!

    updated_at = idea.updated_at
    idea.title = 'Learn about Ruby on Rails'

    assert idea.save
    refute_equal idea.updated_at, updated_at
  end

  test 'removing the title' do
    idea = Idea.new title: 'Learn how to program',
                    user: User.new
    idea.save!

    updated_at = idea.updated_at
    idea.title = ''

    refute idea.save
    assert_equal idea.updated_at, updated_at
  end

  test 'the first complete Idea created is the first in the list' do
    first_idea = Idea.new title: 'Cycle the length of the United Kingdom',
                          photo_url: 'http://mybucketlist.ch/an_image.jpg',
                          done_count: 12,
                          user: User.new
    first_idea.save!

    second_idea = Idea.new title: 'Visit Japan',
                           photo_url: 'http://mybucketlist.ch/second_image.jpg',
                           done_count: 3,
                           user: User.new
    second_idea.save!

    assert_equal(first_idea, Idea.all.first)
  end

  test 'updated_at is changed after updating title' do
    idea = Idea.new title: 'Visit Marrakech',
                    user: User.new
    idea.save!
    first_updated_at = idea.updated_at
    idea.title = 'Visit the market in Marrakech'
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating done_count' do
    idea = Idea.new title: 'title',
                    done_count: 46,
                    user: User.new
    idea.save!
    first_updated_at = idea.updated_at
    idea.done_count = 184
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating photo_url' do
    idea = Idea.new title: 'Swimming',
                    photo_url: '/images/swimmers.jpg',
                    user: User.new
    idea.save!
    first_updated_at = idea.updated_at
    idea.photo_url = '/images/runners.jpg'
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'one matching search result' do
    idea = Idea.new title: 'Stand at the top of the Empire State Building',
                    user: User.new
    idea.save!
    results = Idea.search('the top')
    assert results.length == 1
  end

  test 'no matching search result' do
    idea = Idea.new title: 'Stand at the top of the Empire State Building',
                    user: User.new
    idea.save!
    results = Idea.search('snorkelling')
    assert_empty results
    assert results.empty?
  end

  test 'two matching results' do
    idea = Idea.new title: 'Stand at the top of the Empire State Building',
                    user: User.new
    idea.save!
    idea2 = Idea.new title: 'Stand on the pyramids',
                     user: User.new
    idea2.save!
    results = Idea.search('Stand')
    assert results.length == 2
  end

  test 'no idea record exists' do
    ideas = Idea.most_recent
    assert ideas.empty?
  end

  test 'two idea records exist' do
    idea = Idea.new title: 'First idea',
                    user: User.new
    idea.save!

    idea2 = Idea.new title: 'First idea',
                     user: User.new
    idea2.save!

    recent_ideas = Idea.most_recent
    assert recent_ideas.length == 2
  end

  test 'three idea records returned' do
    idea = Idea.new title: 'First idea',
                    user: User.new
    idea.save!

    idea2 = Idea.new title: 'Second idea',
                     user: User.new
    idea2.save!
    idea3 = Idea.new title: 'Third idea',
                     user: User.new
    idea3.save!
    idea4 = Idea.new title: 'Fourth idea',
                     user: User.new
    idea4.save!
    idea5 = Idea.new title: 'Fifth idea',
                     user: User.new
    idea5.save!
    idea6 = Idea.new title: 'Sixth idea',
                     user: User.new
    idea6.save!

    recent_ideas = Idea.most_recent
    assert recent_ideas.length == 3
  end

  test 'create an idea with a title over the maximum allowed length' do
    idea = Idea.new title: 'This is a title that is too long.  It is supposed to fail, so if it fails please understand that is what is supposed to happen.  Have a good day.  That is all.  Stop reading this now.  Go home.  Are you too good for your home?',
                    user: User.new
    refute idea.save
  end

  test 'ideas without titles are not valid' do
    idea = Idea.new user: User.new
    refute idea.save
  end
end
