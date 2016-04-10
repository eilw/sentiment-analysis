require_relative 'statement'

class ResultSentiment

  def initialize(statement_klass = Statement)
    @statement_klass = statement_klass
  end

  def calculate_sentiment statement
    statement.evaluate_sentiment(:positive)
    statement.evaluate_sentiment(:negative)
    results[:messages] << statement.output
    results[statement.get_sentiment] += 1
  end

  def return(statements, search_term)
    compute_total_sentiment(statements, search_term)
    results
  end

  def compute_total_sentiment statements, search_term
    reset_results(search_term)
    statements.each do |statement|
      statement = @statement_klass.new(statement[:content])
      calculate_sentiment(statement) if statement.contains?(search_term)
    end
  end

  private

  attr_reader :results

  def reset_results(search_term)
    @results = { positive: 0, neutral: 0, negative: 0, search_term: search_term, messages: []}
  end


end
