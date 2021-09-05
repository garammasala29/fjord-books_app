# frozen_string_literal: true

class FollowingRelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.active_relationships.create!(follower_id: params[:id])
    redirect_to user_path(@user)
  end

  def destroy
    following = FollowingRelationship.find_by(following_id: current_user.id, follower_id: params[:id])
    following.destroy
    redirect_to user_path(@user)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
