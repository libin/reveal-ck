require_relative '../lib/reveal-ck'

# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

# Utility function: returns the reveal-ck/spec directory
def spec_dir
  invoking_spec = caller[0].split(':')[0]
  parent_dir_of_spec = File.dirname invoking_spec
  spec_index = parent_dir_of_spec.rindex 'spec'
  parent_dir_of_spec[0...(spec_index + 'spec'.size)]
end
