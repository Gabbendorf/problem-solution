# frozen_string_literal: true

require 'spec_helper'
require 'parsers/csv_journals_parser'
require 'csv'

data = [
  ["Shanahan, Green and Ziemann", "1337-8688"],
  ["Sporer, Kihn and Turner", "28856503"]
]

csv_journals = CSV.generate do |csv|
  csv << %w[Title ISSN]
  data.each { |column| csv << column }
end

RSpec.describe CsvJournalsParser do
  it "parses csv journal rows into Journals" do
    journals = CsvJournalsParser.parse(csv_journals)

    expect(journals[0].title).to eq("Shanahan, Green and Ziemann")
    expect(journals[0].issn).to eq("1337-8688")
  end

  it "formats journal ISSN for consistency" do
    journals = CsvJournalsParser.parse(csv_journals)

    expect(journals[0].issn).to eq("1337-8688")
    expect(journals[1].issn).to eq("2885-6503")
  end
end
