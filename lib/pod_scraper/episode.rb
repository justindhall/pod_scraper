class PodScraper::Episode
  attr_accessor :title, :summary

  def self.all
    #Scrape Solid Verbal and then return pods based on that data
    self.scrape_episodes

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
    pods = doc.css("content-main page-content")

    pods.each do |pod|
      episode = self.new
      episode.title = doc.search("h3.post-list-item-title").text
      episode.summary = doc.search("p").text
      episode
    end

  end

end
