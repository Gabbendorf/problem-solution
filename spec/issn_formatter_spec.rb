# frozen_string_literal: true

require 'spec_helper'
require 'issn_formatter'

RSpec.describe IssnFormatter do
  it "adds a central hyphen if missing" do
    formatted_issn = IssnFormatter.format("12345678")

    expect(formatted_issn).to eq("1234-5678")
  end

  it "does not add an extra hyphen if already there" do
    formatted_issn = IssnFormatter.format("1234-5678")

    expect(formatted_issn).to eq("1234-5678")
  end
end
