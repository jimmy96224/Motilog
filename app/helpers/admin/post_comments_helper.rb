module Admin::PostCommentsHelper
  
  def display_search_result(search_term)
    return unless search_term.present?

    content_tag(:h2, "検索結果：キーワード - #{search_term}") +
      button_to('一覧に戻る', admin_post_comments_path, method: :get, class: 'btn btn-info')
  end
  
end
