class User < ActiveRecord::Base
  has_secure_password

  has_many :messages

  def as_json options = nil
    super(only: [ :id, :name, :created_at ] )
  end

end
