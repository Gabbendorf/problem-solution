# frozen_string_literal: true

class Journal
  attr_reader :title, :issn

  def initialize(title, issn)
    @title = title
    @issn = issn
  end
end
