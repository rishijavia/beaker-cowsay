require 'beaker-cowsay'

confine :to, :platform => 'ubuntu'

test_name 'Installing cowsay on hosts' do

  step 'test cowsay is not installed on hosts' do
    hosts.each do |host|
      # test cowsay does not exist on hosts
      assert_equal(false, check_for_package(host, 'cowsay'))
    end
  end

  step 'test cowsay is installed on hosts' do
   hosts.each do |host|
     # install cowsay on hosts
     install_cowsay_on(host)
     assert check_for_package(host, 'cowsay')
   end
  end

end