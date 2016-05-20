module Sygaldry
  class Release
    attr_reader :name
    attr_reader :sort_key
    attr_reader :date

    attr_reader :entries

    def initialize(name, sort_key, date: Date.today, entries: [])
      @name = name
      @sort_key = sort_key
      @entries = entries
      @date = date
    end

    def grouped_entries
      entries.sort_by(&:type).group_by(&:type)
    end

    def <=>(other)
      other.sort_key <=> sort_key
    end
  end
end
