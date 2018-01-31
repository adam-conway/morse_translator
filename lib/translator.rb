require 'pry'

class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = {"a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "4" => "....-",
                    "3" => "...--",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => " "}
  end

  def eng_to_morse(string)
    morse_translation = ""
    characters = string.downcase.split("")
    characters.each do |character|
      morse_translation += dictionary[character]
    end
    morse_translation
  end

  def from_file(file_location)
    File.open(file_location).each do |line|
      line = line.strip
      @string = line.to_s
    end
    eng_to_morse(@string)
  end

  def morse_to_eng(morse_code)
    string_translation = ""
    new_dictionary = dictionary.invert
    characters = mapping_morse_code(morse_code.split(/ /))
    characters.each do |character|
      string_translation += new_dictionary[character]
    end
    string_translation
  end

  def mapping_morse_code(characters)
    characters.map! {|code|
      if code == ""
        " "
      else
        code
      end
    }
  end

end

binding.pry
