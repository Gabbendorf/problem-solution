# frozen_string_literal: true

require 'spec_helper'
require 'formatter'

RSpec.describe Formatter do
  it "adds a central hyphen if missing" do
    formatted_issn = Formatter.format_issn("12345678")

    expect(formatted_issn).to eq("1234-5678")
  end

  it "does not add an extra hyphen if already there" do
    formatted_issn = Formatter.format_issn("1234-5678")

    expect(formatted_issn).to eq("1234-5678")
  end
end
