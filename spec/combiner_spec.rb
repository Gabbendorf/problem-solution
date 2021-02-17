# frozen_string_literal: true

require 'spec_helper'
require 'combiner'

RSpec.describe Combiner do
  it "combines and serializes found resources" do
    args = ["--format", "json", "journals.csv", "articles.csv", "authors.json"]
    test_resources_path = "spec/test_resources/"

    expected = Combiner.run(test_resources_path, args)

    expected_json = "[{\"doi\":\"10.1234/altmetric349\",\"title\":\"Awesome Plastic Shirt\",\"author\":\"Greg Kessler V\",\"journal\":\"Sporer, Kihn and Turner\",\"issn\":\"2885-6503\"}]"
    expect(expected).to eq(expected_json)
  end

  it "aborts with a generic error message when a resource is not found" do
    args = ["--format", "json", "journals.wrong", "articles.csv", "authors.json"]

    expect { Combiner.run("resources/", args) }.to raise_error(SystemExit)
  end

  it "aborts with a generic error message when there is a parsing issue" do
    args = ["--format", "json", "journals.csv", "articles.csv", "authors_broken.json"]
    test_resources_path = "spec/test_resources/"

    expect { Combiner.run(test_resources_path, args) }.to raise_error(SystemExit)
  end
end
