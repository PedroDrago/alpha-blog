module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then 'alert-success'
    when :alert then 'alert-danger'
    #when :error then 'alert alert-danger alert-dismissible fade show'
    #when :alert then 'alert alert-warning alert-dismissible fade show'
    
    
    end
  end
end
