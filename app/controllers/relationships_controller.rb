class RelationshipsController < ApplicationController
  def create
    following = current_user.active_relationships.build(follower_id: params[:follower_id])
    following.save
    redirect_to request.referrer
  end

  def destroy
    following = Relationship.find_by(following_id: current_user.id, follower_id: params[:id])
    following.destroy
    redirect_to request.referrer
  end
end
