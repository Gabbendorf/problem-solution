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
      articles = CsvArticlesParser.parse(File.read(path + parsed_args.articles_file))
      authors = JsonAuthorsParser.parse(File.read(path + parsed_args.authors_file))
      journals = CsvJournalsParser.parse(File.read(path + parsed_args.journals_file))
    rescue StandardError
      abort("Resources not found")
    end

    full_articles = FullArticlesMapper.new.map(journals, articles, authors)
    FullArticlesSerializer.serialize(full_articles, parsed_args.format)
  end
end
