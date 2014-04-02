class UserListsController < WebsocketRails::BaseController

  def new_user
    WebsocketRails[message[:room]].connections
    WebsocketRails[message[:room]].trigger 'new_user', { name: (user_signed_in? ? current_user.name : 'Guest') }
  end


end