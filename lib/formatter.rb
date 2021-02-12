# frozen_string_literal: true

class Formatter
  def self.format_issn(issn)
    issn.delete("-").insert(4, "-")
  end
end
