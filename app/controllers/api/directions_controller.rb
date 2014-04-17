class Api::DirectionsController < ApplicationController
  def create
    @directions = []
    params[:steps].each do |step|
      @directions << Direction.create(
        content: step[:content],
        recipe_id: params[:recipe_id]
      )
    end
  end
end