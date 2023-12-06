module ApplicationHelper
  
  def profile_image_link(user)
    if user_signed_in?
      link_to(user_path(user)) do
        image_tag(user.get_profile_image(100, 100))
      end
    elsif admin_signed_in?
      link_to(admin_user_path(user)) do
        image_tag(user.get_profile_image(100, 100))
      end
    end
  end
  
  def user_name_link(user)
    if user_signed_in?
      link_to(user_path(user)) do
        user.name
      end
    elsif admin_signed_in?
      link_to(admin_user_path(user)) do
        user.name
      end
    end
  end
  
  def display_latest_log_details(instrument)
    if instrument.logs.present?
      latest_log = instrument.logs.last
      content_tag(:div, class: 'mt-1') do
        concat(content_tag(:div, latest_log.created_at.strftime('%m/%d')))
        concat(content_tag(:div, truncate(latest_log.log, length: 10)))
      end
    end
  end

  # デフォルトのサイズを(50, 50)に指定
  def display_diary_image(diary, width = 50, height = 50)
    if diary.diary_image.attached?
      image_tag diary.get_diary_image(width, height)
    end
  end
  
  def display_comment_count(diary)
    return unless diary.post_comments.present?
    content_tag(:div, "#{diary.post_comments.count} 💭".html_safe)
  end

  def display_favorites_count(diary)
    return unless diary.favorites.present?
    content_tag(:div, "#{diary.favorites.count} 💛".html_safe)
  end
  
  def inactive_user_message(user)
    if !user.is_active
      content_tag(:h2, '退会もしくは停止中のユーザー', class: 'text-danger font-weight-bold')
    end
  end

end
