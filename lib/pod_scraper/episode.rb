class PodScraper::Episode
  attr_accessor :title, :summary, :publish_date

  def self.all
    #Scrape Solid Verbal and then return pods based on that data
    self.scrape_solid

  end

  def self.scrape_episodes
    episodes = []

    episodes << self.scrape_solid

    #Go to Solid Verbal, find episodes
    #extract the properties
    #instantiate a episode






    # episode_1=self.new
    # episode_1.title="solid"
    # episode_1.date="9/12/18"
    # episode_1.summary="Lorem ipsum"
    #
    # episode_2=self.new
    # episode_2.title="verbal"
    # episode_2.date="10/3/18"
    # episode_2.summary="ipsum Lorem"
    #
    # [episode_1, episode_2]
    episodes
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
