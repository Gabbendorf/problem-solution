# frozen_string_literal: true

require "author"

class AuthorsMapper
  def map(rows)
    rows.map { |row| Author.new(row["name"], row["articles"]) }
  end
end
