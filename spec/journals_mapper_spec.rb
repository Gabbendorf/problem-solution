# frozen_string_literal: true

require 'spec_helper'
require 'journals_mapper'

journal_rows = [
  {
    "Title" => "Shanahan, Green and Ziemann", "ISSN" => "1337-8688"
  },
  {
    "Title" => "Sporer, Kihn and Turner", "ISSN" => "28856503"
  }
]

RSpec.describe JournalsMapper do
  let(:journals_mapper) { JournalsMapper.new }

  it "maps rows of journals" do
    journals = journals_mapper.map(journal_rows)

    expect(journals[0].title).to eq("Shanahan, Green and Ziemann")
    expect(journals[0].issn).to eq("1337-8688")
  end

  it "formats journal ISSN for consistency" do
    journals = journals_mapper.map(journal_rows)

    expect(journals[0].issn).to eq("1337-8688")
    expect(journals[1].issn).to eq("2885-6503")
  end
end
