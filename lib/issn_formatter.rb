# frozen_string_literal: true

class IssnFormatter
  def self.format(issn)
    issn.delete("-").insert(4, "-")
  end
end
