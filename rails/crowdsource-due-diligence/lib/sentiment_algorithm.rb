require_relative 'sentiment_library'
require_relative 'message'

class SentimentAlgorithm

  include SentimentLibrary


  NEGATORS = ['not', 'isnt', 'arent', 'aint', 'hardly', 'un', 'dont', 'no', 'non']


  def words msg
    msg.gsub("'", "").split(/[_\W]+/)
  end

  def negated? word
    NEGATORS.include?(word)
  end

  def negated_adverb? word, lib
    lib.include?(word)
  end

  def keyword_matching(libs, word_array)
    matches = []
    libs[:lookup].each {|word| matches << word if word_array.include?(word)}
    matches
  end

  def enumerate_message_sentiment valence, msg
    word_array = words(msg.content)
    libs = get_libs(valence)
    matches = keyword_matching(libs, word_array)
    word_array.each.with_index do |word, ind|
      if matches.include?(word)
        next if negated?(word_array[ind-1])
        next if negated_adverb?(word_array[ind+1], libs[:reject])
        msg.add_matches(valence, word)
      end
    end
  end

  def absolute_message_sentiment msg
    enumerate_message_sentiment(:positive, msg)
    enumerate_message_sentiment(:negative, msg)
    msg.calculate_sentiment
    @results[:messages] << msg.output
    @results[msg.sentiment] += 1
  end


  def compute_total_sentiment messages, search_term
    @results = { positive: 0, neutral: 0, negative: 0, search_term: search_term, messages: []}
    messages.each do |msg|
      msg = Message.new(msg[:content])
      if msg.contains?(search_term)
        absolute_message_sentiment(msg)
      end
    end
    @results
  end
end
