WebsocketRails::EventMap.describe do
  namespace :chatroom do 

    namespace :messages do 
      subscribe :create, 'messages#create'
    end

  end
end
