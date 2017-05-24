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

  # Tests cowsay on different hosts
  describe '#cowsay' do

    context 'on ubuntu' do
      let(:platform) {Beaker::Platform.new('ubuntu-1604-x86_64')}

      it 'it calls on' do
        hosts.each do |host|
          expect(subject).to receive(:on)
          subject.cowsay(host, "hello")
        end
      end

    end

  end

  describe '#install_cowsay_on' do

    context 'on ubuntu' do
      let(:platform) {Beaker::Platform.new('ubuntu-1604-x86_64')}

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

end
