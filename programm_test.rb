require "./test.rb"
require "./result_printer.rb"

printer = ResultPrinter.new

test = Test.new

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

test.get_name

printer.get_hello(test)

while test.status != 1 do
  test.next_question
end

printer.print_total(test)
