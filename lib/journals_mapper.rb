# frozen_string_literal: true

require "journal"
require "formatter"

class JournalsMapper
  def map(rows)
    rows.map do |row|
      Journal.new(row["Title"], Formatter.format_issn(row["ISSN"]))
    end
  end
end
