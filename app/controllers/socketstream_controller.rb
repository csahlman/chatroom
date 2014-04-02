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

    def new_subscriber
      puts "new subscriber"
      puts WebsocketRails.users.inspect 
    end

    def subscriber_part
      puts "subscriber left" 
    end
end