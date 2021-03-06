class RoomsController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def show
    @user=User.find_by(id: params[:id])
    @room_id = message_room_id(current_user, @user)
    @messages = Message.where(room_id: @room_id)
  end

  def message_room_id(first_user, second_user)
    first_id = first_user.id.to_i
    second_id = second_user.id.to_i
    if first_id < second_id
      "#{first_user.id}-#{second_user.id}"
    else
      "#{second_user.id}-#{first_user.id}"
    end
  end
end
