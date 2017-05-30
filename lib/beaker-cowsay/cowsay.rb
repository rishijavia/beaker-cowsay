module Beaker
  module DSL
    module Cowsay

      # Runs cowsay command on a host
      def cowsay(host, quote)

        unless quote.is_a?(String)
          raise ArgumentError.new("The quote should be a string")
        end

        # Make cowsay command
        quote = 'cowsay ' + quote

        # Run cowsay on host
        on(host, quote)
      end

      # Installs cowsay on host unless it's is installed
      def install_cowsay_on(host)
        install_package(host, 'cowsay') unless check_for_package(host, 'cowsay')
      end

    end
  end
end
