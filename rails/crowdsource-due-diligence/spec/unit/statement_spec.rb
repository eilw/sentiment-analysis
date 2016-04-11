require 'rails_helper'

describe Statement do

  subject(:statement) { described_class.new() }

  def helper_evaluate_sentiment(msg)
    msg.evaluate_sentiment(:positive)
    msg.evaluate_sentiment(:negative)
  end

  describe '#contains?' do
      let(:s_msg){Statement.new('iphone is expensive')}
      let(:p_msg) {Statement.new('iphones are expensive')}
      let(:s_search_term) {'iPhone'}
      let(:p_search_term) {'iPhones'}

    it 'is able to match singular search to plural results' do
      expect(p_msg.contains?(s_search_term)).to eq true
    end

    it 'is able to match plural search to singular result' do
      expect(s_msg.contains?(p_search_term)).to eq true
    end
  end

  describe '#evaluate_sentiment' do
    pos_msg = {content: 'I am good, she is bad, overall good'}
    neg_msg = {content: 'I am good, she is bad, overall bad'}
    neut_msg = {content: 'I am good, she is bad'}

    it 'finds positive' do
      msg = Statement.new('I am good, she is bad, overall good')
      helper_evaluate_sentiment(msg)
      expect(msg.get_sentiment).to eq :positive
    end

    it 'finds negative' do
      msg = Statement.new('I am good, she is bad, overall bad')
        helper_evaluate_sentiment(msg)
        expect(msg.get_sentiment).to eq :negative
    end

    it 'finds neutral' do
      msg = Statement.new('I am good, she is bad')
      helper_evaluate_sentiment(msg)
      expect(msg.get_sentiment).to eq :neutral
    end
  end


  describe 'edge cases' do

    describe 'multiple words' do
      it 'is able to match two phrases' do
        msg = Statement.new("A long time ago, in a galaxy far, far away...")
        search_term = "In a galaxy"
        expect(msg.contains?(search_term)).to be true
      end
    end

    describe 'non-words' do
      let(:msg) {Statement.new('Urijah Faber is a good fighter!')}
      let(:nonsense_search) {'abe'}
      let(:chars) {['/', '-', '_', '\\', '&', '@', '!', '?', ' ']}

      it 'doesn\'t match results for partial/non-words' do
        expect(msg.contains?(nonsense_search)).to be false
      end

      it 'accounts for special characters-combined words' do
        chars.each do |char|
          tweet = Statement.new("Abe#{char}Lincoln")
          expect(tweet.contains?(nonsense_search)).to be true
        end
      end
    end

    describe 'false negatives and positives' do

      it 'does not increment negative sentiment if negated' do
        msg = Statement.new('Pie ain\'t bad')
        helper_evaluate_sentiment(msg)
        expect(msg.get_sentiment).to eq :neutral
      end


      it 'does not increment positive sentiment if negated' do
        msg = Statement.new('Pie ain\'t bad')
        helper_evaluate_sentiment(msg)
        expect(msg.get_sentiment).to eq :neutral
      end
    end

    describe 'tricky adverb edge case' do

      it 'positive valence not offset by negative adverb' do
        msg = Statement.new('Pizza is terribly tasty')
        helper_evaluate_sentiment(msg)
        expect(msg.get_sentiment).to eq :positive
      end

      it 'negative valence not offset by positive adverb' do
        msg = Statement.new('Pizza is amazingly shit')
        helper_evaluate_sentiment(msg)
        expect(msg.get_sentiment).to eq :negative
      end
    end
  end
end
