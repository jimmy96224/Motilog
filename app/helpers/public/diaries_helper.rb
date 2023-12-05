module Public::DiariesHelper

  def display_instrument_name(diary)
    if diary.user == current_user
      link_to_user_instrument(diary)
    else
      diary.instrument.name
    end
  end

  def edit_diary_link(diary)
    return unless @user == current_user
    link_to "編集する", edit_user_diary_path(user_id: current_user, id: diary), class: 'btn btn-secondary'
  end
  
  def favorite_diary_link(diary, user)
    if diary.favorited_by?(user)
      link_to user_diary_favorite_path(user_id: user, diary_id: diary), method: :delete do
        "♥#{diary.favorites.count}"
      end
    else
      link_to user_diary_favorite_path(user_id: user, diary_id: diary), method: :post do
        "♡#{diary.favorites.count}"
      end
    end
  end
  
  def user_comment_link(post_comment, current_user)
    link_text = if post_comment.user == current_user
                  "(自分) #{post_comment.user.name}<br>".html_safe
                else
                  "#{post_comment.user.name}<br>".html_safe
                end
                
    link_to user_path(id: post_comment.user.id) do
      link_text
    end
  end
  
  def delete_comment_link(post_comment, current_user, user, diary)
    if post_comment.user == current_user
      link_to user_diary_post_comment_path(user_id: user, diary_id: diary, id: post_comment), method: :delete, class: "btn btn-danger" do
        "コメントを削除"
      end
    end
  end
  
  def instruments_required_message(user)
    if user && !user.instruments.present?
      content_tag(:div, class: 'row mt-2 justify-content-center') do
        content_tag(:div, class: 'd-flex') do
          message = content_tag(:div, class: 'text-danger') do
            content_tag(:h3, '日誌には楽器の登録が必要です。登録はこちら→')
          end
          button = content_tag(:div, class: 'ml-2') do
            link_to(new_user_instrument_path(user.id)) do
              content_tag(:button, class: 'btn btn-secondary link-secondary bg-gray') do
                content_tag(:i, '', class: 'fas fa-guitar', style: 'color: white;')
              end
            end
          end
          message + button
        end
      end
    end
  end

  private

  def link_to_user_instrument(diary)
    link_to diary.instrument.name, user_instrument_path(user_id: diary.user_id, id: diary.instrument.id)
  end

end
