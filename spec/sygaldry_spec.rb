require 'spec_helper'

describe Sygaldry do
  it 'has a version number' do
    expect(Sygaldry::VERSION).to match(Gem::Version::ANCHORED_VERSION_PATTERN)
  end
end
