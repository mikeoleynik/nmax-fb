# frozen_string_literal: true

RSpec.describe Nmax do
  let(:number) { '5' }
  let(:text) { 'Obama made $2.7 million in 2008' }
  let(:cli) { Nmax::Cli.new(text, number) }

  it 'has a version number' do
    expect(Nmax::VERSION).not_to be nil
  end

  it 'number of digit is exist' do
    expect(cli.calculate_number).not_to be_nil
  end

  it 'return sorted numbers' do
    expect(cli.calculate_number).to eq([2008, 7, 2])
  end

  it 'number of digit <= passed value' do
    cli.calculate_number.size <= number.to_i
  end
end
