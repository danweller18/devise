module ApplicationHelper

# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def devise_flash
    if controller.devise_controller? && resource.errors.any?
      flash.now[:error] = resource.errors.full_messages.join(", ")
    end
  end
end
