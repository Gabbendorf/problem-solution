# frozen_string_literal: true

class WrongCommandError < StandardError
  def initialize(message)
    super(message)
  end
end
