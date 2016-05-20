$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sygaldry'
require 'sygaldry/contributor'

module Fixture
  module_function

  def changelog
    changelog = Sygaldry::Changelog.new('Sygaldry', 'CHANGELOG.md')
    %w(1.5 2.2 0.39.0).each do |v|
      changelog.releases << Sygaldry::Release.new(v, Gem::Version.create(v)).tap do |r|
        r.entries << Sygaldry::Entry.new('fjdslfjkksdlfjdksl',
                                         [Sygaldry::Contributor.new('Samuel Giddins', 'https://github.com/')],
                                         [Sygaldry::Reference.new('#21', 'https://github.com/21')], Sygaldry::EntryType.new('Bug Fixes'))
        r.entries << Sygaldry::Entry.new('fdsfdsfds',
                                         [Sygaldry::Contributor.new('Samuel Giddins', 'https://github.com/')],
                                         [Sygaldry::Reference.new('#21', 'https://github.com/21')], Sygaldry::EntryType.new('Enhancements'))
      end
    end
    changelog
  end
end

RSpec.configure do |_c|
end
