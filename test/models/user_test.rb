require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Create a new user with mixed case email address' do
    user = User.new email: 'nEw@EpFl.Ch', password: '123'
    user.save!
    assert user.valid?
    assert_equal user.email, 'new@epfl.ch'
  end
end
