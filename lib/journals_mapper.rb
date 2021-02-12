# frozen_string_literal: true

require "journal"

class JournalsMapper
  def map(rows)
    rows.map { |row| Journal.new(row["Title"], row["ISSN"]) }
  end
end
