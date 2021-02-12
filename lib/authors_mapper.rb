# frozen_string_literal: true

require_relative 'author'

class AuthorsMapper
  def self.map(rows)
    rows.map { |row| Author.new(row["name"], row["articles"]) }
  end
end
