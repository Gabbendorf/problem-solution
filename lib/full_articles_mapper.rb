# frozen_string_literal: true

require_relative 'full_article'

class FullArticlesMapper
  def map(journals, articles, authors)
    full_articles = []
    journals_by_issn = journals_table(journals)
    authors_by_doi = authors_table(authors)

    articles.each do |article|
      matched_journal = journals_by_issn[article.issn]
      next unless matched_journal

      matched_authors = authors_by_doi[article.doi]
      next unless matched_authors

      full_articles << FullArticle.new(
        article.doi,
        article.title,
        author_names(matched_authors),
        matched_journal.title,
        article.issn
      )
    end
    full_articles
  end

  private

  def journals_table(journals)
    journals.map { |journal| [journal.issn, journal] }.to_h
  end

  def authors_table(authors)
    authors_hashed = {}
    authors.each do |author|
      author.articles.each do |doi|
        if authors_hashed.key?(doi)
          authors_hashed[doi] << author
        else
          authors_hashed[doi] = [author]
        end
      end
    end
    authors_hashed
  end

  def author_names(authors)
    authors.map(&:name)
  end
end
