# frozen_string_literal: true

require_relative '../models/journal'
require_relative '../issn_formatter'
require 'csv'

class CsvJournalsParser
  def self.parse(csv_journals)
    parsed = CSV.parse(csv_journals, headers: true)
    parsed.map do |row|
      Journal.new(row["Title"], IssnFormatter.format(row["ISSN"]))
    end
  end
end
