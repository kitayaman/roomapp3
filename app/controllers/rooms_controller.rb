class RoomsController < ApplicationController
  before_action :set_q
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create #ルーム新規登録
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to root_path
    else
      flash[:alert] = "ルーム登録に失敗しました"
      render 'new'
    end
  end

  def show 
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def posts
    @rooms = Room.where(user_id:current_user.id)
  end

  def search
    @rooms = @q.result
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:name, :address, :introduction , :price, :room_image)
  end

end
