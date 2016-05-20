module Sygaldry
  class Changelog
    def initialize(name, path)
      @name = name
      @path = path
      @releases = []
    end

    attr_reader :name
    attr_reader :path

    attr_reader :releases

    def save_as(path = self.path, withFormat: Format.new)
      File.open(path, format(withFormat))
    end

    def format(format = Format.new)
      format.format_changelog(self)
    end
  end
end
