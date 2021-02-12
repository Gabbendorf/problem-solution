# frozen_string_literal: true

require 'spec_helper'
require 'authors_mapper'

author_rows = [
  {
    "name" => "Amari Lubowitz",
    "articles" => ["10.1234/altmetric0", "10.1234/altmetric652"]
  }
]

RSpec.describe AuthorsMapper do
  it "maps rows of authors" do
    authors_mapper = AuthorsMapper.new

    authors = authors_mapper.map(author_rows)

    expected_articles = ["10.1234/altmetric0", "10.1234/altmetric652"]

    expect(authors[0].name).to eq("Amari Lubowitz")
    expect(authors[0].articles).to eq(expected_articles)
  end
end
