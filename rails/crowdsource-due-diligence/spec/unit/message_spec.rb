require 'rails_helper'

describe Message do

  subject(:message) { described_class.new() }

  describe '#search_term_match?' do
      let(:s_msg){Message.new('iphone is expensive')}
      let(:p_msg) {Message.new('iphones are expensive')}
      let(:s_search_term) {'iPhone'}
      let(:p_search_term) {'iPhones'}

    it 'is able to match singular search to plural results' do
      expect(p_msg.contains?(s_search_term)).to eq true
    end

    it 'is able to match plural search to singular result' do
      expect(s_msg.contains?(p_search_term)).to eq true
    end
  end

  describe 'edge cases' do

    describe 'multiple words' do
      it 'is able to match who phrases' do
        msg = Message.new("A long time ago, in a galaxy far, far away...")
        search_term = "In a galaxy"
        expect(msg.contains?(search_term)).to be true
      end
    end

    describe 'non-words' do
      let(:msg) {Message.new('Urijah Faber is a good fighter!')}
      let(:nonsense_search) {'abe'}
      let(:chars) {['/', '-', '_', '\\', '&', '@', '!', '?', ' ']}

      it 'doesn\'t match results for partial/non-words' do
        expect(msg.contains?(nonsense_search)).to be false
      end

      it 'accounts for special characters-combined words' do
        chars.each do |char|
          tweet = Message.new("Abe#{char}Lincoln")
          expect(tweet.contains?(nonsense_search)).to be true
        end
      end
    end
  end
end
