LESS_THAN_TWENTY = [
  "",
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten",
  "Eleven",
  "Twelve",
  "Thirteen",
  "Fourteen",
  "Fifteen",
  "Sixteen",
  "Seventeen",
  "Eighteen",
  "Nineteen"
].freeze

MULT_OF_TEN = %w(Zero Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety).freeze

def num_to_english(n)
  english_num = ""
  millions = n / 1000000
  n %= 1000000
  english_num += millions > 0 ? hundreds_to_english(millions) + " Million " : ""

  thousands = n / 1000
  n %= 1000
  english_num += thousands > 0 ? hundreds_to_english(thousands) + " Thousand " : ""

  english_num += hundreds_to_english(n)
  english_num.strip
end

def hundreds_to_english(n)
  english_hundreds = ""
  hundreds_digit = n / 100
  last_two_digits = n % 100
  if hundreds_digit > 0
    english_hundreds += LESS_THAN_TWENTY[hundreds_digit] + " Hundred "
  end
  english_hundreds += tens_to_english(last_two_digits)
  english_hundreds.strip
end

def tens_to_english(n)
  tens_digit = n / 10
  ones_digit = n % 10
  if n < 20
    LESS_THAN_TWENTY[n]
  else
    MULT_OF_TEN[tens_digit] +
      (ones_digit != 0 ? "-" + LESS_THAN_TWENTY[ones_digit] : "")
  end
end

if $PROGRAM_NAME == __FILE__
  (1..1000000).each do |n|
    puts num_to_english(n)
  end
end
