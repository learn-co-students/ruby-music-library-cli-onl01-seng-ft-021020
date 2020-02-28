module Concerns::Findable
  def find_by_name(name)
    return all.find{|item| item.name == name} 
  end
  
  def find_or_create_by_name(name)
    find = find_by_name(name)
    if (find != nil)
      return find
    else
      return create(name)
    end
  end
  
  
end