module Sygaldry
  class Format
    attr_reader :entry_format
    attr_reader :changelog_format
    attr_reader :release_format

    DEFAULT_ENTRY_FORMAT = ERB.new(<<-ERB.strip, nil, '-')
* <%= message.strip.chomp('.') %>.#{'  '}
<%- contributors.each do |contributor| -%>
  [<%= contributor.name %>](<%= contributor.url %>)
<%- end -%>
<%- references.each do |reference| -%>
  [<%= reference.name %>](<%= reference.url %>)
<%- end -%>
    ERB

    DEFAULT_CHANGELOG_FORMAT = ERB.new(<<-ERB, nil, '-')
# <%= name %> CHANGELOG

<%= releases.sort.map {|r| __format__.format_release(r) }.join("\n").strip %>
    ERB

    DEFAULT_RELEASE_FORMAT = ERB.new(<<-ERB.strip, nil, '-')
## <%= name %> (<%= date.strftime('%Y-%m-%d') %>)

<%- grouped_entries.each do |type, entries| -%>
##### <%= type %>

<%= entries.map {|e| __format__.format_entry(e) }.join("\n") %>
<%- end -%>
    ERB

    def initialize(entry_format: DEFAULT_ENTRY_FORMAT,
                   changelog_format: DEFAULT_CHANGELOG_FORMAT,
                   release_format: DEFAULT_RELEASE_FORMAT)
      @entry_format = entry_format
      @changelog_format = changelog_format
      @release_format = release_format
    end

    def format_changelog(changelog)
      changelog_format.result(binding_for(changelog))
    end

    def format_entry(entry)
      entry_format.result(binding_for(entry))
    end

    def format_release(release)
      release_format.result(binding_for(release))
    end

    private

    def binding_for(obj)
      obj.send(:eval, 'binding').tap do |b|
        b.local_variable_set(:__format__, self)
      end
    end
  end
end
