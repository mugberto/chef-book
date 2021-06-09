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
end
