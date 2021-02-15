# frozen_string_literal: true

class FullArticle
  attr_reader :doi, :title, :authors, :journal, :issn

  def initialize(doi, title, authors, journal, issn)
    @doi = doi
    @title = title
    @authors = authors
    @journal = journal
    @issn = issn
  end

  def to_hash
    {
      doi: @doi,
      title: @title,
      author: extract_author_names,
      journal: @journal,
      issn: @issn
    }
  end

  def to_array
    [@doi, @title, extract_author_names, @journal, @issn]
  end

  private

  def extract_author_names
    @authors.join(", ")
  end
end
