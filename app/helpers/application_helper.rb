module ApplicationHelper
  def marked_li_with_link_to(name, path, options = {})
    li_options = { class: ('active' if current_page?(path)) }.merge(options[:li_options] || {})
    link_options = options[:link_options] || {}

    content_tag(:li, li_options) { link_to(name, path, link_options) }
  end
end
