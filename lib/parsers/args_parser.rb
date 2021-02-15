# frozen_string_literal: true

require_relative '../errors/wrong_command_error'
require_relative '../errors/wrong_resources_error'
require_relative '../errors/messages'

class ArgsParser
  def parse(args)
    raise(WrongCommandError, Messages::WRONG_COMMAND_ERROR) unless args.size == 5 && valid_format?(args)

    resources = [args[2], args[3], args[4]]
    raise(WrongResourcesError, Messages::WRONG_RESOURCES_ERROR) unless valid_resources?(resources)

    format_type = args[1]
    resources_table = resources.map { |resource| [resource.split(".")[0], resource] }.to_h
    Args.new(format_type, resources_table)
  end

  private

  def valid_format?(args)
    format_flag = args[0]
    format_type = args[1]

    format_flag == "--format" && %w[json csv].include?(format_type)
  end

  def valid_resources?(resources)
    resources.sort == %w[articles.csv authors.json journals.csv]
  end
end

class Args
  attr_reader :format, :resources

  def initialize(format, resources)
    @format = format
    @resources = resources
  end
end
