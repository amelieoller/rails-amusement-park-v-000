class User < ActiveRecord::Base
  has_secure_password
  
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness < self.nausea
      "sad"
    else
      "happy"
    end    
  end

  def has_enough_tickets?(attraction)
    self.tickets > attraction.tickets
  end

  def is_tall_enough?(attraction)
    self.height > attraction.min_height
  end

end
