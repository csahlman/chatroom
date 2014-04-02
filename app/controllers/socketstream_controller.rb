class SocketstreamController < WebsocketRails::BaseController
    def initialize_session
      puts "Session Initialized"
    end

    def client_connected
      if user_signed_in?
        send_message :new_client, { name: current_user.name } 
      else
        send_message :new_client, { name: "Guest" }
      end
    end

    # def client_disconnected
    #   puts "User disconnected"
    #   connection_store[:screen_name] = nil
    #   # connection_store[:screen_name].delete({ name: (user_signed_in? ? current_user.name : 'Guest') })
    #   # WebsocketRails[:new_chatroom].trigger 'user_left_room', { name: (user_signed_in? ? current_user.name : 'Guest') }
    # end
end