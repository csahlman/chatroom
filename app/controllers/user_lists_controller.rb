class UserListsController < WebsocketRails::BaseController

  def new_user
    # WebsocketRails[:new_chatroom].trigger :new_user, { name: (user_signed_in? ? current_user.name : 'Guest') }
    connection_store[:screen_name] = { name: (user_signed_in? ? current_user.name : 'Guest' )}
  end

  def show_all_users
    users = connection_store.collect_all(:screen_name)
    WebsocketRails[:new_chatroom].trigger :user_list, users
  end

  def client_disconnected
    puts "client_disconnected"
    connection_store[:screen_name] = nil
    users = connection_store.collect_all(:screen_name)
    WebsocketRails[:new_chatroom].trigger :user_list, users
  end


end