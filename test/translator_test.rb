require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator.rb'
require 'pry'

class TranslatorTest < Minitest::Test
  def setup
  end

  def test_translator_class_initalizes
    translator = Translator.new
    assert_equal "c", translator.dictionary.keys[2]
    assert_equal " ", translator.dictionary.keys[-1]
    assert_equal "-----", translator.dictionary.values[-2]
    assert_equal "-...", translator.dictionary.values[1]
  end

  def test_eng_to_morse
    translator = Translator.new
    assert_equal "......-...--.", translator.eng_to_morse("help")
    assert_equal "-. ...-.----", translator.eng_to_morse("te st1")
  end

  def test_downcase
    translator = Translator.new
    assert_equal "......-...--.", translator.eng_to_morse("heLP")
    assert_equal "-....-...--", translator.eng_to_morse("Test3")
  end

  def test_running_translate_from_file
    translator = Translator.new
    assert_equal ".. .--- ..-. .- ..-....-...", translator.from_file("./lib/input.txt")
  end

  def test_translate_morse_code_to_english
    translator = Translator.new
    assert_equal "he llo", translator.morse_to_eng(".... .  .-.. .-.. ---")
    assert_equal "t3st1ng", translator.morse_to_eng("- ...-- ... - .---- -. --.")
    assert_equal "sp   ace", translator.morse_to_eng("... .--.    .- -.-. .")
  end
end
