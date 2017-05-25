require 'beaker-cowsay'

confine :to, :platform => 'ubuntu'

def test_cow(quote)
  return " _______
< #{quote} >
 -------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||"
end

# Test cowsay
test_name 'test cowsay' do

  hosts.each do |host|
    cowsay(host, "i can mooo, can you?") do |result|
      assert_equal(test_cow("i can mooo, can you?"), result)
    end
  end

  hosts.each do |host|
    cowsay(host, 'i clean my input \n check it out') do |result|
      assert_equal(test_cow('i clean my input n check it out'), result)
    end
  end

end