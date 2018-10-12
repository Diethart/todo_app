module NavbarMenuHelper
  def generate_link(path, title, method = :get)
    content_tag(:li, class: link_class(path)) do
      link_to title, path, class: 'nav-link', method: method
    end
  end

  private

  def link_class(path)
    return 'nav-item active' if current_page? path
    'nav-item'
  end
end
