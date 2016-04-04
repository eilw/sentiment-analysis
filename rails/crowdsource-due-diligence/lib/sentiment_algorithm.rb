require_relative 'sentiment_library'
require_relative 'message'

class SentimentAlgorithm

  include SentimentLibrary

  attr_reader :current_message

  NEGATORS = ['not', 'isnt', 'arent', 'aint', 'hardly', 'un', 'dont', 'no', 'non']

  def words msg
    msg.gsub("'", "").split(/[_\W]+/)
  end

  def search_term_match? msg, search_term
    msg = msg.downcase
    search_term = search_term.downcase
    if search_term.split(' ').length > 1
      msg.include? search_term
    else
      words(msg).any?{|word| word_in_message?(search_term, word)}
    end
  end

  def word_in_message?(search_term, word)
    search_term == word ||
    search_term.pluralize == word ||
    search_term == word.pluralize
  end

  def negated? word
    NEGATORS.include?(word)
  end

  def negated_adverb? word, lib
    lib.include?(word)
  end

  def keyword_matching(libs, msg)
    matches = []
    libs[:lookup].each {|word| matches << word if msg.include?(word)}
    matches
  end

  def add_key_word(valence, word)
    current_message[:posWords] << word if valence == :positive
    current_message[:negWords] << word if valence == :negative
  end

  def enumerate_message_sentiment valence, msg
    libs = get_libs(valence)
    matches = keyword_matching(libs,msg)
    msg.each.with_index do |word, ind|
      if matches.include?(word)
        next if negated?(msg[ind-1])
        next if negated_adverb?(msg[ind+1], libs[:reject])
        current_message[valence] += 1
        add_key_word(valence, word)
      end
    end
  end

  def absolute_message_sentiment msg
    word_array = words(msg)
    @current_message = {
                        sentiment: nil,
                        posWords: [],
                        negWords: [],
                        content: msg,
                        positive: 0,
                        negative: 0
                      };
    enumerate_message_sentiment(:positive, word_array)
    enumerate_message_sentiment(:negative, word_array)
    pos, neg = current_message[:positive], current_message[:negative]
    (current_message[:sentiment] = :positive) if pos > neg
    (current_message[:sentiment] = :negative) if neg > pos
    (current_message[:sentiment] = :neutral) if pos == neg
  end


  def compute_total_sentiment messages, search_term
    results = { positive: 0, neutral: 0, negative: 0, search_term: search_term, messages: []}
    messages.each do |msg|
      msg = msg[:content]
      if search_term_match?(msg, search_term)
        absolute_message_sentiment(msg)
        results[:messages] << current_message
        results[current_message[:sentiment]] += 1
      end
    end
    results
  end
end
