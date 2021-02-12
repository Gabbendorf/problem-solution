# frozen_string_literal: true

require 'spec_helper'
require 'articles_mapper'

article_rows = [
  {
    "DOI" => "10.1234/altmetric0",
    "Title" => "Small Wooden Chair",
    "ISSN" => "1337-8688"
  },
  {
    "DOI" => "10.1234/altmetric1",
    "Title" => "Ergonomic Rubber Shirt",
    "ISSN" => "12885650"
  }
]

RSpec.describe ArticlesMapper do
  it "maps rows of articles" do
    articles = ArticlesMapper.map(article_rows)

    first_article = articles[0]
    expect(first_article.doi).to eq("10.1234/altmetric0")
    expect(first_article.title).to eq("Small Wooden Chair")
    expect(first_article.issn).to eq("1337-8688")
  end

  it "formats articles ISSN for consistency" do
    articles = ArticlesMapper.map(article_rows)

    expect(articles[0].issn).to eq("1337-8688")
    expect(articles[1].issn).to eq("1288-5650")
  end
end
