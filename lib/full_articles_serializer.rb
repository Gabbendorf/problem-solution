# frozen_string_literal: true

require 'json'
require 'csv'

class FullArticlesSerializer
  def self.serialize(full_articles, format)
    if format == "json"
      full_articles.map(&:to_hash).to_json
    else
      CSV.generate do |csv|
        full_articles.each do |full_article|
          csv << full_article.to_array
        end
      end
    end
  end
end
