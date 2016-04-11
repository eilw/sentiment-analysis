require_relative 'word'
require_relative 'sentiment_library'


class Statement
  include SentimentLibrary

  def initialize(msg, word_klass = Word)
    @posWords = []
    @negWords = []
    @content = msg.downcase
    @word_klass = word_klass
  end

  def evaluate_sentiment valence
    libs = get_libs(valence)
    word_array = split_to_words
    keyword_matching(libs, word_array).each do |word|
      add_matches(valence, word) unless edge_case?(word, word_array, libs)
    end
  end


  def contains? search_term
    search_term = search_term.downcase
    if search_term.split(' ').length > 1
      @content.include? search_term
    else
      split_to_words.any?{|word| word.same_as?(search_term)}
    end
  end

  def get_sentiment
    score = sentiment_score
    return :positive if score > 0
    return :neutral if score == 0
    return :negative if score < 0
  end


  def output
    evaluate_sentiment(:positive)
    evaluate_sentiment(:negative)
    {sentiment: get_sentiment, posWords: @posWords, negWords: @negWords, content: @content}
  end

  private

  def keyword_matching(libs, word_array)
    word_array.select { |word| word.is_in?(libs[:lookup])}
  end


  def edge_case?(word, word_array, libs)
    ind = word_array.index(word)
    (word_array[ind-1] && word_array[ind-1].is_in?(NEGATORS)) ||
    (word_array[ind+1] && word_array[ind+1].is_in?(libs[:reject]))
  end


  def split_to_words
    @content
      .delete("'")
      .split(/[_\W]+/)
      .map{|word| @word_klass.new(word)}
  end

  def sentiment_score
    @posWords.length - @negWords.length
  end

  def add_matches(valence, key_word)
    @posWords << key_word.itself if valence == :positive
    @negWords << key_word.itself if valence == :negative
  end


end
