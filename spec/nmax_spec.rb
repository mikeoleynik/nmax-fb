# frozen_string_literal: true

RSpec.describe Nmax do
  let(:number) { '5' }
  let(:number_is_nil) { nil }
  let(:number_is_string) { 'string' }
  let(:text) { 'Obama made $2.7 million in 2008' }

  let(:cli) do
    ->(text, number) { Nmax::Cli.new(text, number) }
  end

  it 'has a version number' do
    expect(Nmax::VERSION).not_to be nil
  end

  it 'number of digit is exist' do
    expect(cli[text, number].find_digits).not_to be_nil
  end

  it 'return sorted numbers' do
    expect(cli[text, number].find_digits).to eq([2008, 7, 2])
  end

  it 'number of digit <= passed value' do
    cli[text, number].find_digits.size <= number.to_i
  end

  it 'if numbers of digit not passed, then raise error' do
    expect { cli[text, number_is_nil] }.to raise_exception(Nmax::Errors::InvalidValue)
  end

  it 'if numbers of digit is passed, but has the wrong type, then raise error' do
    expect { cli[text, number_is_string] }.to raise_exception(Nmax::Errors::InvalidType)
  end
end
