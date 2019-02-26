require 'pry'
class Acronym
  def self.abbreviate(sentence)
    new(sentence).abbreviate
  end

  def initialize(sentence)
    @sentence = sentence
  end

  def abbreviate
    initials.join('').upcase
  end

  def initials
    words.map { |word| first_letter(word) }
  end

  def words
    @sentence.split( /\s|-|,/)
  end

  def first_letter(word)
    word.split('')[0]
  end
end