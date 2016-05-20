require 'spec_helper'

describe Sygaldry::Format do
  let(:changelog) { Fixture.changelog }
  it 'formats' do
    expect(changelog.format).to eq(<<-EOS)
# Sygaldry CHANGELOG

## 2.2 (2016-05-20)

##### Enhancements

* fdsfdsfds.#{'  '}
  [Samuel Giddins](https://github.com/)
  [#21](https://github.com/21)

##### Bug Fixes

* fjdslfjkksdlfjdksl.#{'  '}
  [Samuel Giddins](https://github.com/)
  [#21](https://github.com/21)


## 1.5 (2016-05-20)

##### Enhancements

* fdsfdsfds.#{'  '}
  [Samuel Giddins](https://github.com/)
  [#21](https://github.com/21)

##### Bug Fixes

* fjdslfjkksdlfjdksl.#{'  '}
  [Samuel Giddins](https://github.com/)
  [#21](https://github.com/21)


## 0.39.0 (2016-05-20)

##### Enhancements

* fdsfdsfds.#{'  '}
  [Samuel Giddins](https://github.com/)
  [#21](https://github.com/21)

##### Bug Fixes

* fjdslfjkksdlfjdksl.#{'  '}
  [Samuel Giddins](https://github.com/)
  [#21](https://github.com/21)
    EOS
  end
end
