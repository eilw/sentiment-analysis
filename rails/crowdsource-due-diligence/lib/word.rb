class Word

  attr_reader :itself

  def initialize(word)
    @itself = word
  end

  def is_in?(lib)
    lib.include?(itself)
  end

  def same_as?(search_term)
    search_term == itself ||
    search_term.pluralize == itself ||
    search_term == itself.pluralize
  end
end
