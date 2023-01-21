module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then 'alert-success'
    when :alert then 'alert-danger'
    when :info then 'alert-primary'
    when :warning then 'alert-warning'
    end
  end

  def badge_class(level)
    case level.name.to_sym
    when :Travel then "text-bg-primary"
    when :Movies then "text-bg-secondary"
    when :Games then "text-bg-info"
    when :Programming then "text-bg-success"
    when :English then "text-bg-danger"
    when :PTBR then "text-bg-warning"
    when :Sugestion then "text-bg-dark"
    when :TV then "text-bg-pink"
    when :Anime then "text-bg-purple"
    else "text-bg-primary"
    end
  end

  def badge_class_form(level)
    case level.to_sym
    when :Travel then "text-bg-primary"
    when :Movies then "text-bg-secondary"
    when :Games then "text-bg-info"
    when :Programming then "text-bg-success"
    when :English then "text-bg-danger"
    when :PTBR then "text-bg-warning"
    when :Sugestion then "text-bg-dark"
    when :TV then "text-bg-pink"
    when :Anime then "text-bg-purple"
    else "text-bg-primary"
    end

  end


end
