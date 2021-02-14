# frozen_string_literal: true

class ArgsParser
  WRONG_COMMAND_ERROR = "Wrong command: make sure you include all the necessary arguments like this: --format json [resources]"
  WRONG_RESOURCES_ERROR = "Invalid resources: please run again the whole command with the valid resources"

  def parse(args)
    raise WRONG_COMMAND_ERROR unless args.size == 5 && valid_format?(args)

    resources = [args[2], args[3], args[4]]
    raise WRONG_RESOURCES_ERROR unless valid_resources?(resources)

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
    supported_resources = %w[articles.csv authors.json journals.csv]
    resources.all? { |resource| supported_resources.include?(resource) }
  end
end

class Args
  attr_reader :format, :resources

  def initialize(format, resources)
    @format = format
    @resources = resources
  end
end
