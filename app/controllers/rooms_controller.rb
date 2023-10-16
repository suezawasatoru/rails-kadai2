class RoomsController < ApplicationController

  def index
    @user = current_user
    @rooms = @user.rooms
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(params.require(:room).permit(:image, :name, :introduction, :price, :adress, :user_id))
     if @room.save
       flash[:notice] = "新規投稿をしました"
       redirect_to :rooms
     else
      @user = current_user
       render "rooms/new"
     end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @user = current_user
  end
  
  def searchindex
    @user = current_user
    if params[:keyword]
      @rooms = Room.search(params[:keyword])
      @count = Room.search(params[:keyword]).count
    elsif params[:area]
      @rooms = Room.searcharea(params[:area])
      @count = Room.searcharea(params[:area]).count
    end
  end
end

