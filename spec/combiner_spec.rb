# frozen_string_literal: true

require 'spec_helper'
require 'combiner'

RSpec.describe Combiner do
  it "combines and serializes resources" do
    args = ["--format", "json", "articles.csv", "authors.json", "journals.csv"]
    test_resources_path = "spec/test_resources/"

    expected = Combiner.run(test_resources_path, args)

    expected_json = "[{\"doi\":\"10.1234/altmetric349\",\"title\":\"Awesome Plastic Shirt\",\"author\":\"Greg Kessler V\",\"journal\":\"Sporer, Kihn and Turner\",\"issn\":\"2885-6503\"}]"
    expect(expected).to eq(expected_json)
  end

  it "aborts with a generic error message when a resource is not found" do
    args = ["--format", "json", "articles.csv", "authors.json", "journals.wrong"]

    expect { Combiner.run(test_resources_path, args) }.to exit
  end
end
