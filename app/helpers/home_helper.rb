module HomeHelper

  
  def render_activity(activity)

    content_tag(:p) do
      case activity
      when User
        activity.name + " joined!"
      when Event
        activity.name + " announced!"
      when Project
        activity.title + " was created!"
      else
        raise "Activity type of " + activity.class.to_s + " not implemented in render_activity view helper"
      end
    end

  end

end
