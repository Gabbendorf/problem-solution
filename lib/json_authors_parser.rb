# frozen_string_literal: true

require 'json'
require_relative 'author'

class JsonAuthorsParser
  def self.parse(json_authors)
    parsed = JSON.parse(json_authors, header: true)
    parsed.map { |row| Author.new(row["name"], row["articles"]) }
  end
end
