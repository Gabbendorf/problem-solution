# frozen_string_literal: true

require_relative 'article'
require_relative 'issn_formatter'
require 'csv'

class CsvArticlesParser
  def self.parse(csv_articles)
    parsed = CSV.parse(csv_articles, headers: true)
    parsed.map do |row|
      Article.new(row["DOI"], row["Title"], IssnFormatter.format(row["ISSN"]))
    end
  end
end
