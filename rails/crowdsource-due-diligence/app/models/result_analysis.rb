class ResultAnalysis

  def initialize(result_sentiment)
    @result_sentiment = result_sentiment
  end

  def analyse_tweets(tweets,search_term)
    @result_sentiment.compute_total_sentiment(tweets,search_term)
  end
end
