module UsersHelper
  def follow_btn(user)
    if user == current_user
      button_to 'follow', follow_path, params: { followed_id: user.id }, disabled: true, class: 'chef-btn-disabled'
    elsif current_user.followed_user? user
      button_to 'unfollow', unfollow_path, params: { followed_id: user.id }, method: :delete, class: 'chef-btn-1'
    else
      button_to 'follow', follow_path, params: { followed_id: user.id }, class: 'chef-btn-1'
    end
  end

  def link_to_log_in_page
    return '' if user_authenticated?

    content_tag(:span, 'Already have an account?') + link_to('Log in', new_session_path)
  end
end
