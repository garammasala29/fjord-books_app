class RelationshipsController < ApplicationController
  def create
    following = current_user.active_relationships.build(following_id: params[:user_id])
    following.save
    redirect_to request.referer
  end

  def destroy
    following = current_user.active_relationships.find_by(following_id: params[:user_id])
    following.destroy
    redirect_to request.referer
  end
end
