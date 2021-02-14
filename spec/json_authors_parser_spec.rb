# frozen_string_literal: true

require 'spec_helper'
require 'json_authors_parser'
require 'json'

json_authors = [
  {
    "name" => "Amari Lubowitz",
    "articles" => ["10.1234/altmetric0", "10.1234/altmetric652"]
  }
].to_json

RSpec.describe JsonAuthorsParser do
  it "parses json author rows into Authors" do
    authors = JsonAuthorsParser.parse(json_authors)

    expected_articles = ["10.1234/altmetric0", "10.1234/altmetric652"]
    expect(authors[0].name).to eq("Amari Lubowitz")
    expect(authors[0].articles).to eq(expected_articles)
  end
end
