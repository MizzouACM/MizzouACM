class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user_id, :summary
  @@markdown = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML,
    :autolink => true,
    :space_after_headers => true)

  def markdown_summary
    @@markdown.render self.summary
  end
  def markdown_body
    @@markdown.render self.body
  end
end
