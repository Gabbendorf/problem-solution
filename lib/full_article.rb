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
end
