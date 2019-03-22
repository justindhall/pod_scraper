#CLI Controller
class PodScraper::CLI

  def call
    lists_pods
    menu
    goodbye
  end

  def lists_pods
    puts "Recent pods: "
    @pods = PodScraper::Episode.all
    @pods.each.with_index(1) do |pod, i|
      puts "#{i}. #{pod.title} - #{pod.summary}"
    end
  end

  def menu

    input = nil
    while input != "exit"
      puts "Enter the number of the pod you want more info on or type 'list' to see the pods again or type 'exit' to exit: "
      input = gets.strip.downcase

      if input.to_i > 0
        the_pod = @pods[input.to_i-1]
        puts "#{the_pod.title} - #{the_pod.summary}"
      elsif input == "list"
        lists_pods
      else
        "I'm unsure what you meant. Please enter a valid input."
      end
    end
  end

  def goodbye
    puts "Stay Solid!"
  end

end
