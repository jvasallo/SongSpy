class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :meanings

  def owns?(obj)
    self.id == obj.user_id
  end
end
