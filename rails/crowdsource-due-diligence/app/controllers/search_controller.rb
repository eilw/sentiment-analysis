require_relative '../../lib/result_sentiment'
# require_relative '../../lib/search'
# require_relative '../../lib/result_analysis'
# require_relative '../../lib/twitter_client'




class SearchController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def index
    render :text => "Ok!"
  end

  def create
    search = Search.new(TwitterClient.new)
    search_result_twitter = search.twitter_search(params)
    resultanalysis = ResultAnalysis.new(ResultSentiment.new)

    # search_result_twitter = get_fake_tweets
    results = resultanalysis.analyse_tweets(search_result_twitter, params[:"search_term"])
    results[:date_from] = params[:"date_from"]
    render json: results.to_json
  end
end
