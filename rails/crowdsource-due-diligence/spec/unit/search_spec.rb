require 'rails_helper'
require 'Search'

describe Search do
  subject(:search) {described_class.new(twitterclient)}

  # let(:tweet) { double('tweet', :collect=> [])}
  # let(:response){double('response', :take => tweet)}
  # let(:client) {double('client', :search => response)}
  let(:twitterclient) {double('twitter_client')}

  describe "Twitter Search"
    it 'responds to twitter client search' do
      allow(twitterclient).to receive(:search)
      expect(twitterclient).to receive(:search)
      search.twitter_search('test')
    end
  end
