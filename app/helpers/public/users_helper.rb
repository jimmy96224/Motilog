module Public::UsersHelper

  def display_user_goal(user)
    if user == current_user
      content_tag(:span, user.goal)
    end
  end

  def display_tag_name(tag_name)
    return unless tag_name.present?
    content_tag(:span, "タグ：#{tag_name}", class: "h4 mr-3")
  end

  def return_to_list_link(user, tag_name)
    return unless tag_name.present?
    link_to "一覧へ戻る", user_path(user), class: "btn btn-secondary btn-sm"
  end

  def display_tag_list(tags)
    tags.map do |tag|
      content_tag(:div, link_to(tag, user_path(id: @user, tag_name: tag, filtered_by_tag: true), class: "text-white"), class: "btn btn-primary")
    end.join.html_safe
  end


end
