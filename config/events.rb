WebsocketRails.setup do |config|
  #     # Defaults to :id
  config.user_identifier = :name

end

WebsocketRails::EventMap.describe do
  subscribe :client_connected, to: SocketstreamController, with_method: :client_connected
  subscribe :client_disconnected, 'user_lists#client_disconnected'

  subscribe :subscriber_join, 'socketstream#new_subscriber'

  subscribe :subscriber_part, 'socketstream#subscriber_part'


  namespace :chatroom do 

    subscribe :new_chatter, 'user_lists#new_user'
    subscribe :get_users, 'user_lists#get_users'

    namespace :messages do 
      subscribe :create, 'messages#create'
    end

  end
end
