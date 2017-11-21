# english_nums_spec.rb

require 'rspec'
require 'english_nums'

describe '#num_to_english' do
  context 'given a number less than 100' do
    it 'returns correct word for [1-9]' do
      expect(num_to_english(0)).to eq("")
      expect(num_to_english(1)).to eq("One")
      expect(num_to_english(2)).to eq("Two")
      expect(num_to_english(3)).to eq("Three")
      expect(num_to_english(4)).to eq("Four")
      expect(num_to_english(5)).to eq("Five")
      expect(num_to_english(6)).to eq("Six")
      expect(num_to_english(7)).to eq("Seven")
      expect(num_to_english(8)).to eq("Eight")
      expect(num_to_english(9)).to eq("Nine")
    end

    it 'returns correct word for numbers [11-19]' do
      expect(num_to_english(11)).to eq("Eleven")
      expect(num_to_english(12)).to eq("Twelve")
      expect(num_to_english(13)).to eq("Thirteen")
      expect(num_to_english(14)).to eq("Fourteen")
      expect(num_to_english(15)).to eq("Fifteen")
      expect(num_to_english(16)).to eq("Sixteen")
      expect(num_to_english(17)).to eq("Seventeen")
      expect(num_to_english(18)).to eq("Eighteen")
      expect(num_to_english(19)).to eq("Nineteen")
    end

    it 'returns correct words for multiples of 10' do
      expect(num_to_english(10)).to eq("Ten")
      expect(num_to_english(20)).to eq("Twenty")
      expect(num_to_english(30)).to eq("Thirty")
      expect(num_to_english(40)).to eq("Forty")
      expect(num_to_english(50)).to eq("Fifty")
      expect(num_to_english(60)).to eq("Sixty")
      expect(num_to_english(70)).to eq("Seventy")
      expect(num_to_english(80)).to eq("Eighty")
      expect(num_to_english(90)).to eq("Ninety")
    end

    it 'returns correctly hyphenated words for [21-99]' do
      expect(num_to_english(76)).to eq("Seventy-Six")
      expect(num_to_english(81)).to eq("Eighty-One")
    end
  end

  context 'given a number in [100-999]' do
    it 'returns correctly hyphenated words for [121-999]' do
      expect(num_to_english(121)).to eq("One Hundred Twenty-One")
      expect(num_to_english(116)).to eq("One Hundred Sixteen")
    end
    it 'returns correct words for multiples of 100' do
      expect(num_to_english(100)).to eq("One Hundred")
      expect(num_to_english(600)).to eq("Six Hundred")
      expect(num_to_english(700)).to eq("Seven Hundred")
    end
    it 'returns correct words for numbers with last digit 0' do
      expect(num_to_english(590)).to eq("Five Hundred Ninety")
    end
    it 'returns correct words for numbers with middle digit 0' do
      expect(num_to_english(101)).to eq("One Hundred One")
      expect(num_to_english(709)).to eq("Seven Hundred Nine")
    end
  end

  context 'given a number in [1000-999999]' do
    it 'returns correct words for four digit numbers' do
      expect(num_to_english(6101)).to eq("Six Thousand One Hundred One")
      expect(num_to_english(7005)).to eq("Seven Thousand Five")
    end
    it 'returns correctly hyphenated words' do
      expect(num_to_english(121008)).to eq("One Hundred Twenty-One Thousand Eight")
      expect(num_to_english(100300)).to eq("One Hundred Thousand Three Hundred")
      expect(num_to_english(837265)).to eq("Eight Hundred Thirty-Seven Thousand Two Hundred Sixty-Five")
    end
    it 'returns correct words for multiples of 1000' do
      expect(num_to_english(6000)).to eq("Six Thousand")
      expect(num_to_english(57000)).to eq("Fifty-Seven Thousand")
      expect(num_to_english(101000)).to eq("One Hundred One Thousand")
    end
    it 'returns correct words for multiples of 10000' do
      expect(num_to_english(60000)).to eq("Sixty Thousand")
      expect(num_to_english(550000)).to eq("Five Hundred Fifty Thousand")
    end
    it 'returns correct words for multiples of 100000' do
      expect(num_to_english(600000)).to eq("Six Hundred Thousand")
      expect(num_to_english(900000)).to eq("Nine Hundred Thousand")
      expect(num_to_english(300000)).to eq("Three Hundred Thousand")
    end
  end

  context 'given 1000000' do
    it 'returns correctly for one million' do
      expect(num_to_english(1000000)).to eq("One Million")
    end
  end
end
