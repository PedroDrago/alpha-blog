module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email = user.email.downcase
    hash = Digest::MD5.hexdigest(email)
    size = options[:size]
    gravatar = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar, alt: user.username, class: 'rounded mx-auto d-block mb-2')
  end

  def flash_class(level)
    case level.to_sym
    when :notice then 'alert alert-success alert-dismissible fade show'
    when :alert then 'alert alert-danger alert-dismissible fade show'
    #when :error then 'alert alert-danger alert-dismissible fade show'
    #when :alert then 'alert alert-warning alert-dismissible fade show'
    
    
    end
  end





end
