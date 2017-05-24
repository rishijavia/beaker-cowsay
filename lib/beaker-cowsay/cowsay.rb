module Beaker
  module DSL
    module Cowsay

      # Runs cowsay command on a host
      def cowsay(host, quote)

        # Convert quote to string
        quote = quote.to_s

        # Make cowsay command
        quote = 'cowsay ' + quote

        # Install cowsay and run the cowsay command
        on(host, quote)
      end

      # Installs cowsay on host unless it's is installed
      def install_cowsay_on(host)
        install_package(host, 'cowsay') unless check_for_package(host, 'cowsay')
      end

    end
  end
end
