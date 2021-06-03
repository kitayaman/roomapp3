class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      flash[:alert] = @reservation.errors.full_messages.to_sentence
      redirect_back(fallback_location: rooms_path)
    end
  end

  def create 
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "ルームを予約しました"
      redirect_to root_path
    else
      flash[:alert] = "予約に失敗しました"
      render 'new'
    end
  end

  def show
    @reservations = Reservation.where(user_id:current_user.id)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date ,:total_amount, :person_num, :user_id, :room_id, :room_price, :person_num)
  end
end
