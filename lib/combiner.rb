# frozen_string_literal: true

require_relative 'parsers/args_parser'
require_relative 'parsers/csv_articles_parser'
require_relative 'parsers/json_authors_parser'
require_relative 'parsers/csv_journals_parser'
require_relative 'full_articles_mapper'
require_relative 'full_articles_serializer.rb'

class Combiner
  def self.run(path, args)
    parsed_args = ArgsParser.new.parse(args)

    begin
      csv_journals = File.read(path + parsed_args.journals_file)
      csv_articles = File.read(path + parsed_args.articles_file)
      json_authors = File.read(path + parsed_args.authors_file)
    rescue StandardError
      abort("Resources not found")
    end

    begin
      journals = CsvJournalsParser.parse(csv_journals)
      articles = CsvArticlesParser.parse(csv_articles)
      authors = JsonAuthorsParser.parse(json_authors)
    rescue StandardError
      abort("Something went wrong when parsing the resources")
    end

    full_articles = FullArticlesMapper.new.map(journals, articles, authors)
    FullArticlesSerializer.serialize(full_articles, parsed_args.format)
  end
end
