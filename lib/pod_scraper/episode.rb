class PodScraper::Episode
  attr_accessor :title, :summary, :publish_date

  def self.all
    #Scrape Solid Verbal and then return pods based on that data
    self.scrape_solid

  end

  def self.scrape_solid

    doc = Nokogiri::HTML(open("https://www.solidverbal.com/all-posts/"))
    #pods = doc.css("container post-content post-list")

    doc.css(".post-list-item").map do |pod|
      #binding.pry
      episode = PodScraper::Episode.new
      episode.title = pod.css("h3.post-list-item-title").text
      episode.summary = pod.css("p").text
      episode.publish_date = pod.css("post-list-item-meta").text
      episode

    end
  end

end
