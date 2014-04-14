class DirectionsController < ApplicationController
  def create
    params[:steps].each do |step|
      Direction.create(
        content: step[:content],
        recipe_id: params[:recipe_id]
      )
    end
    redirect_to 'index'
  end
end