# frozen_string_literal: true

require_relative 'article'
require_relative 'formatter'
require 'csv'

class CsvArticlesParser
  def self.parse(csv_articles)
    parsed = CSV.parse(csv_articles, headers: true)
    parsed.map do |row|
      Article.new(row["DOI"], row["Title"], Formatter.format_issn(row["ISSN"]))
    end
  end
end
