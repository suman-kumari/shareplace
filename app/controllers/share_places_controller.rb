class SharePlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
      @share_places = SharePlace.user_or_friend(current_user)
      @hash = Gmaps4rails.build_markers(@share_places) do |share_place, marker|
        marker.lat share_place.place.latitude
        marker.lng share_place.place.longitude
        marker.infowindow share_place.place.title
      end
    else
      @share_places = Place.are_public
      @hash = Gmaps4rails.build_markers(@share_places) do |place, marker|
        marker.lat place.latitude
        marker.lng place.longitude
        marker.infowindow place.title
      end
    end
  end

  def new
    @share_place = current_user.share_places.new
  end

  def create
    @share_place = current_user.share_places.new(share_place_params)
    @share_place.place_id = params[:place_id]

    if @share_place.save
      flash[:notice] = "Your Place Shared Successfully."
      redirect_to user_share_places_path(current_user)
    else
      render :new
    end
  end

  protected

  def share_place_params
    params.require(:share_place).permit(:friend_id, :place_id, :is_public)
  end
end
