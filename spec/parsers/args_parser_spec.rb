# frozen_string_literal: true

require 'spec_helper'
require 'parsers/args_parser'

RSpec.describe ArgsParser do
  let(:args_parser) { ArgsParser.new }

  describe "validates args length" do
    it "checks that the command has 5 args" do
      args_with_valid_size = ["--format", "json", "articles.csv", "authors.json", "journals.csv"]

      parsed_args = args_parser.parse(args_with_valid_size)

      expect(parsed_args.format).to eq("json")
      expect(parsed_args.articles_file).to eq("articles.csv")
      expect(parsed_args.authors_file).to eq("authors.json")
      expect(parsed_args.journals_file).to eq("journals.csv")
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
end
