# frozen_string_literal: true

require 'spec_helper'
require 'parsers/args_parser'

RSpec.describe ArgsParser do
  let(:args_parser) { ArgsParser.new }

  describe "validates args length" do
    it "checks that the command has 5 args" do
      args_with_valid_size = ["--format", "json", "articles.csv", "authors.json", "journals.csv"]

      parsed_args = args_parser.parse(args_with_valid_size)

      expected_resources = {
        "articles" => "articles.csv",
        "authors" => "authors.json",
        "journals" => "journals.csv"
      }
      expect(parsed_args).to have_attributes("format" => "json", "resources" => expected_resources)
    end

    it "raises a wrong command error if one arg is missing" do
      args_with_missing = ["--format", "articles.csv", "authors.json", "journals.csv"]

      expect { args_parser.parse(args_with_missing) }.to raise_error(WrongCommandError)
    end
  end

  describe "validates format flag and type combination" do
    it "raises an error if the format flag is wrong" do
      args_with_wrong_format_flag = ["--wrong_flat", "json", "articles.csv", "authors.json", "journals.csv"]

      expect { args_parser.parse(args_with_wrong_format_flag) }.to raise_error(WrongCommandError)
    end

    it "raises a wrong command error if the format type is invalid" do
      args_with_wrong_format_type = ["--wrong_flat", "invalid format", "articles.csv", "authors.json", "journals.csv"]

      expect { args_parser.parse(args_with_wrong_format_type) }.to raise_error(WrongCommandError)
    end
  end

  describe "validates resources" do
    it "raises a wrong resources error for unrecognised resources" do
      args_with_wrong_resources = ["--format", "json", "something.csv", "wrong.json", "invalid.csv"]

      expect { args_parser.parse(args_with_wrong_resources) }.to raise_error(WrongResourcesError)
    end

    it "raises a wrong resources error if a valid resource is entered twice" do
      args_with_wrong_resources = ["--format", "json", "articles.csv", "authors.json", "articles.csv"]

      expect { args_parser.parse(args_with_wrong_resources) }.to raise_error(WrongResourcesError)
    end

    it "parses the resources into a table" do
      args = ["--format", "json", "articles.csv", "authors.json", "journals.csv"]

      resources = args_parser.parse(args).resources

      expected_resources = {
        "articles" => "articles.csv",
        "authors" => "authors.json",
        "journals" => "journals.csv"
      }
      expect(resources).to eq(expected_resources)
    end

    it "recognises valid resources regardless of the order they are entered" do
      args = ["--format", "json", "journals.csv", "articles.csv", "authors.json"]

      resources = args_parser.parse(args).resources

      expect(resources.values).to eq(["journals.csv", "articles.csv", "authors.json"])
    end
  end
end
