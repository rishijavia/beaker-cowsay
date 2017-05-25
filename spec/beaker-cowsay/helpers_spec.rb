require 'spec_helper'

class ClassMixedWithDSLHelpers
  include BeakerTestHelpers
  include Beaker::DSL::Cowsay

  def logger
    RSpec::Mocks::Double.new('logger').as_null_object
  end

end

describe ClassMixedWithDSLHelpers do

  # Tests release conditions
  describe 'release conditions' do

    it 'has updated the version number from the original template' do
      expect( Beaker::DSL::Cowsay::Version::STRING ).to_not be === '0.0.1rc0'
    end

    it 'has a MAINTAINERS doc' do
      expect( File.exist?( 'MAINTAINERS' ) ).to be_truthy
    end

  end

  let(:hosts) do
    make_hosts({:platform => platform })
  end

  let(:platform) {Beaker::Platform.new('ubuntu-1604-x86_64')}

  # Tests cowsay on different hosts
  describe '#cowsay' do

    it 'calls on method from beaker DSL' do
      hosts.each do |host|
        expect(subject).to receive(:on)
        subject.cowsay(host, "hello")
      end
    end

    it 'raises argumenterror when string not provided' do
      hosts.each do |host|
        expect {subject.cowsay(host, 2211)}.to raise_error(ArgumentError)
        expect {subject.cowsay(host, false)}.to raise_error(ArgumentError)
      end
    end

  end

  describe '#install_cowsay_on' do

    it 'does not call install_package' do
      hosts.each do |host|
        expect(subject).to_not receive(:install_package)
        expect(subject).to receive(:check_for_package) {true}
        subject.install_cowsay_on(host)
      end
    end

    it 'calls install_package' do
      hosts.each do |host|
        expect(subject).to receive(:install_package)
        expect(subject).to receive(:check_for_package) {false}
        subject.install_cowsay_on(host)
      end
    end

  end

end
