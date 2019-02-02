require 'test_helper'

class RolesHelperTest < ActionView::TestCase
  attr_accessor :current_user

  test 'registered users can edit owned ideas' do
    user = User.create(email: 'test@epfl.ch')
    self.current_user = user

    idea = Idea.create(title: 'A test idea', user: user)

    assert can_edit?(idea)
  end

  test 'admin can edit any idea' do
    user = User.create(email: 'admin@epfl.ch', role: 'admin')
    self.current_user = user
    idea = Idea.create(title: 'A test idea', user: User.create(email: 'alt@epfl.ch'))
    assert can_edit?(idea)
  end

  test 'registered user cannot edit ideas he doesnt own' do
    user = User.create(email: 'test@epfl.ch')
    self.current_user = user

    idea = Idea.create(title: 'A test idea', user: User.create(email: 'alt@epfl.ch'))

    assert_not can_edit?(idea)
  end

end
