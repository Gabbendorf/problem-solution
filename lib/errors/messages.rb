# frozen_string_literal: true

module Messages
  WRONG_COMMAND_ERROR = "Invalid command: make sure you enter all the arguments and a valid format type\n(e.g. ruby combine.rb --format json articles.csv authors.json journals.csv)"
  WRONG_RESOURCES_ERROR = "Invalid resources: resources must be articles.csv, authors.json and journals.csv in any order"
end
