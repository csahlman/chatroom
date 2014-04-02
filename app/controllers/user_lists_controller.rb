class UserListsController < WebsocketRails::BaseController

  def get_users
    # WebsocketRails[:new_chatroom].subscribers.each { |sub| puts sub.inspect }
    users = WebsocketRails[:new_chatroom].subscribers.map &:user
    users.map! { |user| user.nil? ? user = { name: 'Guest', created_at: Time.now } : user }
    WebsocketRails[:new_chatroom].trigger :user_list, users

  end

  def client_disconnected
    # puts "client_disconnected"
    # connection_store[:screen_name] = nil
    # users = connection_store.collect_all(:screen_name)
    # WebsocketRails[:new_chatroom].trigger :user_list, users
  end


end