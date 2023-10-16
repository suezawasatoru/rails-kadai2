class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = @user.reservations
  end

  def confirm
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :guest, :user_id, :room_id))
    if @reservation.invalid?
      @room = @reservation.room
      render "rooms/show" 
    end
  end

  def create
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :guest, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "新規予約をしました"
      redirect_to :reservations
    else
     @room = @reservation.room
      render "rooms/show"
    end
  end
end
