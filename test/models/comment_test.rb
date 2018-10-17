require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'changing the associated Idea for a comment' do
    idea = Idea.new(title: 'Riding a camel', user: User.new)
    idea.save!
    comment = Comment.new
    comment.body = "I'd like to do this"
    comment.idea = idea

    comment.user = User.new(email: 'me@home.com')
  
    comment.save!

    idea2 = Idea.new(title: 'dancing in the dark', user: User.new)
    idea2.save!
    comment.idea = idea2
    comment.save!

    assert_equal idea2, Comment.first.idea 
  end

  test 'cascading save' do
    idea = Idea.new(title: 'Riding a camel', user: User.new)
    idea.save!
   
    comment = Comment.new(body: 'Great idea!', user: idea.user)
    idea.comments  << comment
    idea.save!

    assert_equal comment, Comment.first
  end

  test 'Comments are ordered correctly' do

    idea = Idea.new(title: 'Riding a camel', user: User.new)
    idea.save!
   
    comment = Comment.new(body: 'That would be great fun', user: idea.user) 
    comment2 = Comment.new(body: 'I agree!  That sounds like a good time', user: idea.user)
    
    idea.comments << comment
    idea.comments << comment2
    idea.save!

    assert_equal idea.comments.first, comment
    assert_equal 2, idea.comments.length


  end
end
