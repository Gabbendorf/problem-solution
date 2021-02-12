# frozen_string_literal: true

require_relative 'article'
require_relative 'formatter'

class ArticlesMapper
  def self.map(rows)
    rows.map do |row|
      Article.new(row["DOI"], row["Title"], Formatter.format_issn(row["ISSN"]))
    end
  end
end
