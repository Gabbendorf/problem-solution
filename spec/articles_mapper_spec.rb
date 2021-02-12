# frozen_string_literal: true

require 'spec_helper'
require 'articles_mapper'

article_rows = [
  {
    "DOI" => "10.1234/altmetric0",
    "Title" => "Small Wooden Chair",
    "ISSN" => "1337-8688"
  }
]

RSpec.describe ArticlesMapper do
  it "maps rows of articles" do
    articles_mapper = ArticlesMapper.new

    articles = articles_mapper.map(article_rows)

    first_article = articles[0]
    expect(first_article.doi).to eq("10.1234/altmetric0")
    expect(first_article.title).to eq("Small Wooden Chair")
    expect(first_article.issn).to eq("1337-8688")
  end
end
