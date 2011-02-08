module RSSFeedApi
  class Feed
  def self.parseFeed (url, length)
    feed_url = url
    output = "";
    open(feed_url) do |http|
      response = http.read
      result = RSS::Parser.parse(response, false)
      output = "<span class=\"feedTitle\">#{result.channel.title}</span><br /><ul>" 
      
      result.items.each_with_index do |item, i|
        output += "<li><a href=\"#{item.title}\"></a></li>" if ++i < length  
      end 
      output += "</ul>" 
    end
    return output
  end
  
  
    def self.run(url)
      xml = REXML::Document.new Net::HTTP.get(URI.parse(url))
      data = {
        :title    => xml.root.elements['channel/title'].text,
        :home_url => xml.root.elements['channel/link'].text,
        :rss_url  => url,
        :items    => []
        
      }
      xml.elements.each '//item' do |item|
        new_items = {} and item.elements.each do |e| 
          new_items[e.name.gsub(/^dc:(\w)/,"\1").to_sym] = e.text
        end
        data[:items] << new_items
      end
      data
    end
end
end