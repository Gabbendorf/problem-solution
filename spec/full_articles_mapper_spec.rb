# frozen_string_literal: true

require 'spec_helper'
require 'full_articles_mapper'
require 'models/article'
require 'models/journal'
require 'models/author'

RSpec.describe FullArticlesMapper do
  let(:full_articles_mapper) { FullArticlesMapper.new }

  describe "there are combinable articles, journals and authors" do
    it "maps only matching data into full articles" do
      articles = [
        Article.new("10.1234/altmetric0", "First Title", "0000-0000"),
        Article.new("10.1234/altmetric1", "Second Title", "0000-0001"),
        Article.new("10.1234/altmetric2", "Third Title", "0000-0002")
      ]

      journals = [
        Journal.new("First Journal", "0000-0000"),
        Journal.new("Second Journal", "0000-0001")
      ]

      authors = [
        Author.new("First Author",
                   ["10.1234/altmetric0", "10.1234/altmetric4"]),
        Author.new("Second Author",
                   ["10.1234/altmetric0", "10.1234/altmetric2"])
      ]

      full_articles = full_articles_mapper.map(journals, articles, authors)

      expected_articles = [
        FullArticle.new(
          "10.1234/altmetric0",
          "First Title",
          ["First Author", "Second Author"],
          "First Journal",
          "0000-0000"
        )
      ]

      expect(full_articles.size).to eq(1)

      actual_full_article = full_articles[0]
      expected_full_article = expected_articles[0]
      expect(actual_full_article.doi).to eq(expected_full_article.doi)
      expect(actual_full_article.title).to eq(expected_full_article.title)
      expect(actual_full_article.authors).to eq(expected_full_article.authors)
      expect(actual_full_article.journal).to eq(expected_full_article.journal)
      expect(actual_full_article.issn).to eq(expected_full_article.issn)
    end
  end

  describe "there are no combinable articles, journals and authors" do
    it "cannot map anything into full articles" do
      articles = [Article.new("10.1234/altmetric0", "First Title", "0000-0000")]
      journals = [Journal.new("First Journal", "0000-0001")]
      authors = [Author.new("First Author", ["10.1234/altmetric1"])]

      full_articles = full_articles_mapper.map(journals, articles, authors)

      expect(full_articles).to eq([])
    end
  end
end
