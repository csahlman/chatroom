class MessagesController < WebsocketRails::BaseController
  # before_filter :authenticate_user

  def create
    @message = current_user.messages.create! message
    response = {
      body: @message.body,
      user_name: current_user.name,
      created_at: @message.created_at
    }
    trigger_success response
  end

end