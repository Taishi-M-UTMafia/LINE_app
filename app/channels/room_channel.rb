class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    user=User.find_by(id: data['to_id'])
    room_id = message_room_id(current_user, user)
    Message.create! content: data['message'], user_id: current_user.id,
                    from_id: current_user.id, to_id: user.id,
                    room_id: room_id
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
