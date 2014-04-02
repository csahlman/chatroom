WebsocketRails::EventMap.describe do
  subscribe :client_connected, to: SocketstreamController, with_method: :client_connected
  subscribe :client_disconnected, to: SocketstreamController, with_method: :client_disconnected


  namespace :chatroom do 

    subscribe :new_chatter, 'user_lists#new_user'
    subscribe :get_users, 'user_lists#show_all_users'

    namespace :messages do 
      subscribe :create, 'messages#create'
    end

  end
end
