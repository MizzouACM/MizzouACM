module BootstrapHelper
  def icon_btn(text, icon, color="teal",options=nil)
    render_haml(
      "%button.btn.btn-#{color}#{options}
       %i.icon-#{icon}.icon-white
       #{text}")
  end

  def render_haml(haml)
    engine = Haml::Engine.new haml
    engine.render
  end

end