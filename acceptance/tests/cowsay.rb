require 'beaker-cowsay'

confine :to, :platform => 'ubuntu'

# need to count characters of input to make -- and __ to wrap the quote

def test_cow(quote)
  " #{"_" * (quote.length + 2)}
< #{quote} >
 #{"-" * (quote.length + 2)}
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
"
end

# Test cowsay
test_name 'test cowsay' do

  hosts.each do |host|
     assert_equal(test_cow("i can moo, can you?"), cowsay(host, "i can moo, can you?").stdout)
  end

  hosts.each do |host|
    assert_equal(test_cow("i clean my input n check it out"), cowsay(host, "i clean my input \\n check it out").stdout)
  end

  hosts.each do |host|
    assert_equal(test_cow("i can escape 'characters'"), cowsay(host, "i can escape \\'characters\\'").stdout)
  end

end