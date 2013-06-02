module ApplicationHelper

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def render_activity(activity)

    content_tag(:p) do
      case activity
      when User
          activity.name + " joined!"
      when Event
        activity.name + " announced!"
      else
        "Error!"
      end
    end

  end

end
