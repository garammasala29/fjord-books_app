# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#following?' do
    assert_not @alice.following?(@bob)
    @alice.active_relationships.create(following_id: @bob.id)
    assert @alice.following?(@bob)
  end

  test '#followed_by?' do
    assert_not @alice.following?(@bob)
    @alice.active_relationships.create(following_id: @bob.id)
    assert @bob.followed_by?(@alice)
  end

  test '#follow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#unfollow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'garammasala'
    assert_equal 'garammasala', user.name_or_email
  end
end
