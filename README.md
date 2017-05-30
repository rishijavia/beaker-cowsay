# beaker-cowsay

The ultimate library to test cowsay while writing those stressful beaker tests!

# What is this thing?
The Cowsay Beaker library contains everything you need to:

- Install cowsay on your ubuntu SUTs
- Run cowsay on your ubuntu SUTs
 
Note: This library is confined to Ubuntu OSs only, in future it might be expanded to support other OSs

# Documentation
- [Rubydocs](http://www.rubydoc.info/github/rishijavia/beaker-cowsay/master/Beaker/DSL/Cowsay) contains the technical reference for API. They describe how it works and how to use it.

# Spec testing
Spec test live under the `spec` folder. There are the default rake task and therefore can run with a simple command:
`bundle exec rake test:spec`.

# Acceptance testing
All the acceptance tests live in `acceptance` folder. These are Beaker tests and are dependent on having Beaker installed.

You can run the acceptance testing suite by invoking the `bundle exec rake test:acceptance` task. This command will run a pre-suite located at `acceptance/config/pre_suite` folder.
This uses a default provided hosts file of vagrant ubuntu for acceptance under the `acceptance/config/nodes` folder. If you'd like to provide your own hosts file, set the `CONFIG` environment variable.
There is a host file provided for Redhat and Ubuntu on VMPooler in the same directory and can be used by running `CONFIG=acceptance/config/nodes/<host>.yaml`.