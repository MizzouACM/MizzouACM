module BootstrapHelper
  def icon_btn(text, icon, color="teal",options=nil)
    render_haml(
      "%button.btn.btn-#{color}#{options}
       %i.icon-#{icon}.icon-white
       #{text}")
  end
  def lightbox(attachment, caption=nil)
    render_haml('
%a{:href=>("#lightbox#{attachment.id.to_s}"), "data-toggle"=>"lightbox"}
  %img{:src=>(attachment.image.url (:medium))}
.lightbox.hide.fade{"tabindex" => "-1", "role" => "dialog", "aria-hidden"=>"true", :id => "lightbox#{attachment.id.to_s}"}
  .lightbox-content
    %img{:src=>(attachment.image.url (:large))}
    -if caption
      .lightbox-caption=caption', {:caption => caption, :attachment => attachment})
  end
  def render_haml(haml, options={})
    Haml::Engine.new(haml).render Object.new, options
  end

end