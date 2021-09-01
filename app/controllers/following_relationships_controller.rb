# frozen_string_literal: true

class FollowingRelationshipsController < ApplicationController
  def create
    current_user.active_relationships.create(follower_id: params[:follower_id])
    redirect_to request.referer
  end

  def destroy
    following = FollowingRelationship.find_by(following_id: current_user.id, follower_id: params[:id])
    following.destroy
    redirect_to request.referer
  end
end
