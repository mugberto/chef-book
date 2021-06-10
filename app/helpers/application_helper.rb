module ApplicationHelper
  def msg_background(name)
    if name == 'notice'
      'alert alert-success mb-0 rounded-0'
    elsif name == 'alert'
      'alert alert-danger mb-0 rounded-0'
    end
  end

  def log_in_menu
    return '' unless current_user

    content_tag(:span, "Hi #{current_user.fullname}!") + \
      link_to('Log out', session_path(1), method: :delete, class: 'btn btn-secondary ms-3')
  end

  def avatar
    if (!current_user.photo != '') and !current_user.photo.nil?
      return image_tag current_user.photo, class: 'avatar-image w-100 rounded-circle'
    end

    image_tag 'https://raw.githubusercontent.com/mugberto/chefbook-images/'\
      'c63eb908b48acba9f5ead4ee181c7a81c111de1e/Images/avatar-1577909.svg',\
              class: 'rounded-circle w-100'
  end

  def profile_picture(user)
    if (user.photo != '') and !user.photo.nil?
      return image_tag user.photo, class: 'avatar-image w-75 rounded-circle d-block mx-auto'
    end

    image_tag 'https://raw.githubusercontent.com/mugberto/chefbook-images/'\
      'c63eb908b48acba9f5ead4ee181c7a81c111de1e/Images/avatar-1577909.svg',\
              class: 'rounded-circle w-75 d-block mx-auto'
  end

  def cover_image(user)
    if user.coverimage != ''
      "background-image:url(#{user.coverimage})"
    else
      'background-color:gray'
    end
  end
end
