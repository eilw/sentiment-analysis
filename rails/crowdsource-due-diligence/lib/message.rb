class Message

  attr_reader :content, :sentiment
  def initialize(msg)
    @sentiment = nil
    @posWords = []
    @negWords = []
    @content = msg
  end


  def word_in_message?(search_term, word)
    search_term == word ||
    search_term.pluralize == word ||
    search_term == word.pluralize
  end

  def words msg
    msg.gsub("'", "").split(/[_\W]+/)
  end

  def contains? search_term
    msg = content.downcase
    search_term = search_term.downcase
    if search_term.split(' ').length > 1
      msg.include? search_term
    else
      words(msg).any?{|word| word_in_message?(search_term, word)}
    end
  end

  def calculate_sentiment
    if sentiment_score > 0
      @sentiment = :positive
    elsif sentiment_score < 0
      @sentiment = :negative
    else
      @sentiment = :neutral
    end
  end

  def sentiment_score
    @posWords.length - @negWords.length
  end

  def add_matches(valence, key_word)
    @posWords << key_word if valence == :positive
    @negWords << key_word if valence == :negative
  end

  def output
    {sentiment: @sentiment, posWords: @posWords, negWords: @negWords, content: @content}
  end


end
