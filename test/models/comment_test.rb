require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'changing the associated Idea for a comment' do
    idea = Idea.new(title: 'Riding a camel')
    idea.save!
    comment = Comment.new
    comment.body = "I'd like to do this"
    comment.idea = idea
    comment.save!

    idea2 = Idea.new(title: 'dancing in the dark')
    idea2.save!
    comment.idea = idea2
    comment.save!

    assert_equal idea2, Comment.first.idea 
  end
end
