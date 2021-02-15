# frozen_string_literal: true

require 'spec_helper'
require 'parsers/csv_articles_parser'
require 'csv'

data = [
  ["10.1234/altmetric0", "Small Wooden Chair", "1337-8688"],
  ["10.1234/altmetric1", "Ergonomic Rubber Shirt", "12885650"]
]

csv_articles = CSV.generate do |csv|
  csv << %w[DOI Title ISSN]
  data.each { |column| csv << column }
end

RSpec.describe CsvArticlesParser do
  it "parses csv article rows into Articles" do
    articles = CsvArticlesParser.parse(csv_articles)

    first_article = articles[0]
    expect(first_article.doi).to eq("10.1234/altmetric0")
    expect(first_article.title).to eq("Small Wooden Chair")
    expect(first_article.issn).to eq("1337-8688")
  end

  it "formats articles ISSN for consistency" do
    articles = CsvArticlesParser.parse(csv_articles)

    expect(articles[0].issn).to eq("1337-8688")
    expect(articles[1].issn).to eq("1288-5650")
  end
end
