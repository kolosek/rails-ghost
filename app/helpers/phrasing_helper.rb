module PhrasingHelper
  def can_edit_phrases?
    current_user.present? && current_user.admin?
  end

  def safe_phrase(key, default_content = "")
    content = phrase(key) # call phrasing gem
    text_only = ActionView::Base.full_sanitizer.sanitize(content.to_s)
    text_only == key ? phrase(default_content) : content
  end
end
