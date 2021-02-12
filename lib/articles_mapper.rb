# frozen_string_literal: true

require "article"

class ArticlesMapper
  def map(rows)
    rows.map { |row| Article.new(row["DOI"], row["Title"], row["ISSN"]) }
  end
end
