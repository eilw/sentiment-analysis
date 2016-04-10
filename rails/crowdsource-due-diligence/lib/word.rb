class Word

  NEGATORS = ['not', 'isnt', 'arent', 'aint', 'hardly', 'un', 'dont', 'no', 'non']

  attr_reader :itself

  def initialize(word)
    @itself = word
  end

  def negated?
    NEGATORS.include?(itself)
  end

  def is_in?(libs)
    libs.include?(itself)
  end

  def negated_adverb? lib
    lib.include?(itself)
  end

  def same_as?(search_term)
    search_term == itself ||
    search_term.pluralize == itself ||
    search_term == itself.pluralize
  end
end
