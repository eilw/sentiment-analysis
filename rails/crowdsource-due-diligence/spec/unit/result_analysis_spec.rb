require 'rails_helper'
require 'result_analysis'

describe ResultAnalysis do
  let(:algorithm){double('result_sentiment')}
  let(:tweets){double('tweet')}
  let(:search_term){double('search_term')}
  subject(:analysis) {described_class.new(algorithm)}

  describe '#analyse_tweets' do
    it 'sends a request to the result_sentiment' do
      expect(algorithm).to receive(:compute_total_sentiment)
      analysis.analyse_tweets(tweets, search_term)
    end
  end
end
