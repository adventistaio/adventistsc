# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_likeable, only: :create
  before_action :set_like, only: :destroy

  def create
    @like = @likeable.likes.find_or_initialize_by(user: Current.user,
                                                  reactable_id: params[:reactable_id])

    return unless @like.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @likeable = @like.likeable
    @like.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def reaction_params
    params.require(:like).permit(reactable_id:, reactable_type:)
  end

  def set_likeable
    @likeable = params[:reactable_type].classify
                                       .constantize
                                       .find(params[:reactable_id])
  end

  def set_like
    @like = Reaction.find(params[:id])
  end
end
