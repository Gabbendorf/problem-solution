# frozen_string_literal: true

class Article
  attr_reader :doi, :title, :issn

  def initialize(doi, title, issn)
    @doi = doi
    @title = title
    @issn = issn
  end
end
