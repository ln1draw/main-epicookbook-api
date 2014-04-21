class Api::NolistsController < ApplicationController
  def create
    @nolist = Nolist.create(uid: params[:uid], name: params[:name])
    puts 'components'
    params[:components].each do |component|
      @nolist.component_lists.create(
        apid: component['id'], 
        name: component['name'], 
        nolist_id: @nolist.id
      )
    end
    render :show
  end

  def show
    @nolist = Nolist.find(params[:id])
  end

  def by_uid
    @nolists = Nolist.where(uid: params[:uid])
  end
end