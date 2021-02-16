# frozen_string_literal: true

require_relative '../errors/wrong_command_error'
require_relative '../errors/messages'

class ArgsParser
  def parse(args)
    raise(WrongCommandError, Messages::WRONG_COMMAND_ERROR) unless args.size == 5 && valid_output_format?(args)

    format_type = args[1]
    Args.new(format_type, args[2], args[3], args[4])
  end

  private

  def valid_output_format?(args)
    format_flag = args[0]
    format_type = args[1]

    format_flag == "--format" && %w[json csv].include?(format_type)
  end
end

class Args
  attr_reader :format, :articles_file, :authors_file, :journals_file

  def initialize(format, articles_file, authors_file, journals_file)
    @format = format
    @articles_file = articles_file
    @authors_file = authors_file
    @journals_file = journals_file
  end
end
