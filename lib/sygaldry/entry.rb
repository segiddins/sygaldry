module Sygaldry
  class Entry
    attr_reader :message
    attr_reader :contributors
    attr_reader :references
    attr_reader :type

    def initialize(message,
                   contributors,
                   references,
                   type)
      @message = message
      @contributors = contributors
      @references = references
      @type = type
    end

    def format(format)
      format.format_entry(self)
    end
  end
end
