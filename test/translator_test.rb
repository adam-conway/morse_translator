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
    assert_equal "-....-.----", translator.eng_to_morse("test1")
  end
end
