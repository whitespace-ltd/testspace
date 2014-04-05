module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Testspace"      
    end
  end
end
