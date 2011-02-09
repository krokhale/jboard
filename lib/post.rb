class Post
  
  attr_accessor :pubdate, :link, :source, :description, :title
  
  def initialize(hash)
    @pubdate ||= hash[:pubDate].to_time
    @link ||= hash[:link]
    @source ||= hash[:source]
    @description ||= hash[:description]
    @title ||= hash[:title]
  end
  
end