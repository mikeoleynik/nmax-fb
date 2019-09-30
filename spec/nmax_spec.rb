# frozen_string_literal: true

RSpec.describe Nmax do
  let(:number) { '5' }
  let(:number_is_nil) { nil }
  let(:number_is_string) { 'string' }
  let(:text) { 'Obama made $2.7 million in 2008' }

  let(:cli) {
    ->(text, number) { Nmax::Cli.new(text, number) }
  }

  it "has a version number" do
    expect(Nmax::VERSION).not_to be nil
  end

  it "number of digit is exist" do
    expect(cli[text, number].calculate_number).not_to be_nil
  end

  it "return sorted numbers" do
    expect(cli[text, number].calculate_number).to eq([2008, 7, 2])
  end

  it "number of digit <= passed value" do
    cli[text, number].calculate_number.size <= number.to_i
  end

  it "if numbers of digit not passed, then raise error" do
    expect{ cli[text, number_is_nil] }.to raise_error("Number can't be nil. Please enter the number of digits.")
  end

  it "if numbers of digit is passed, but has the wrong type, then raise error" do
    expect{ cli[text, number_is_string] }.to raise_error('Strings are evil! Please enter a digit.')
  end
end
