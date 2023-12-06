module Admin::UsersHelper
  
  def user_status(user)
    if user.is_active
      content_tag(:div, '有効', class: 'text-success font-weight-bold')
    else
      content_tag(:div, '退会', class: 'text-muted font-weight-bold')
    end
  end
  
end
