# frozen_string_literal: true

require_relative 'journal'
require_relative 'formatter'
require 'csv'

class CsvJournalsParser
  def self.parse(csv_journals)
    parsed = CSV.parse(csv_journals, headers: true)
    parsed.map do |row|
      Journal.new(row["Title"], Formatter.format_issn(row["ISSN"]))
    end
  end
end
