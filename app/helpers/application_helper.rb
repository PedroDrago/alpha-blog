module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then 'alert-success'
    when :alert then 'alert-danger'
    when :info then 'alert-primary'
    when :warning then 'alert-warning'
    
    end
  end


end
