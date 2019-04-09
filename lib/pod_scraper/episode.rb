class PodScraper::Episode
  attr_accessor :title, :summary, :publish_date
  @@all = []

  #{:title => "title", :summary => "summary", :publish_date => "publish_date"}

  def initialize(attr_hash)
    @title = attr_hash[:title]
    @summary = attr_hash[:summary]
    @publish_date = attr_hash[:publish_date]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_solid
    doc = Nokogiri::HTML(open("https://www.solidverbal.com/all-posts/"))
    #pods = doc.css("container post-content post-list")

    doc.css(".post-list-item").each do |pod|
      #binding.pry
      attr_hash = {}
      # build your hash rather than using setters....

      attr_hash[:title] = pod.css("h3.post-list-item-title").text
      attr_hash[:summary] = pod.css("p").text
      attr_hash[:publish_date] = pod.css(".post-list-item-meta").text

      #episode.title = pod.css("h3.post-list-item-title").text
      #episode.summary = pod.css("p").text
      #episode.publish_date = pod.css(".post-list-item-meta").text
      # ^^^
      PodScraper::Episode.new(attr_hash)

    end
  end

end
