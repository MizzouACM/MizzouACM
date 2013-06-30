class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :facebook_link, :attachments_attributes
  has_one :attachment, :as => :attachable
  accepts_nested_attributes_for :attachment
  validates_presence_of :date, :description, :location, :name

  @@markdown = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML,
    :autolink => true,
    :space_after_headers => true)

  # Markdown renderer for the event descriptions.
  # May want to eventually make this into a presave hook for Event model
  # to save it as description_rendered or something.  
  # That way it isn't rendering on each page load.
  def rendered_description
    @@markdown.render(description)
  end

end
