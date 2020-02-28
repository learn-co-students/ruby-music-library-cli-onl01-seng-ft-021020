module Basics
  
  module InstanceMethods
    def initialize(name)
       @name = name
     end
  
    def save
      self.class.all << self
    end
  end
  
  module ClassMethods
    
  end
  

end