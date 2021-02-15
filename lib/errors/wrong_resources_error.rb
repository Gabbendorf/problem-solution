# frozen_string_literal: true

class WrongResourcesError < StandardError
  def initialize(message)
    super(message)
  end
end
