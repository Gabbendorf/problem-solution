# frozen_string_literal: true

require 'spec_helper'
require 'journals_mapper'

journal_rows = [
  {
    "Title" => "Shanahan, Green and Ziemann", "ISSN" => "1337-8688"
  }
]

RSpec.describe JournalsMapper do
  it "maps rows of journals" do
    journals_mapper = JournalsMapper.new

    journals = journals_mapper.map(journal_rows)

    expect(journals[0].title).to eq("Shanahan, Green and Ziemann")
    expect(journals[0].issn).to eq("1337-8688")
  end
end
