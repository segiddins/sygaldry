module Sygaldry
  Contributor = Struct.new(:name, :url)
  Reference = Struct.new(:name, :url)
  EntryType = Struct.new(:name) do
    def <=>(other)
      types = ['Breaking Changes', 'Enhancements', 'Bug Fixes']
      types.index(name) <=> types.index(other.name)
    end

    def to_s
      name
    end
  end
end
