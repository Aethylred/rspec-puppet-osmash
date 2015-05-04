# `rspec-puppet-osmash`

[![Build Status](https://travis-ci.org/Aethylred/rspec-puppet-osmash.svg?branch=master)](https://travis-ci.org/Aethylred/rspec-puppet-osmash)

The purpose of this gem is to generate a library of operating system facts (an _osmash library_) from a Puppet Module metadata file (`metadata.json`) with some tools, functions and methods for use with [`rspec-puppet`](http://rspec-puppet.com/).

# Usage

## Initialising an osmash library

It is recommend that the osmash library for a Puppet module be initialised in `spec/rspec_helper.rb` and should automatically find `metadata.json` relative to this location.

```ruby
osmash = Rspec_puppet_osmash.new
```

## Adding expectations

This should then be run through something to attach some `expectations` to each operating system, these expectations should be added using _rules_ rather than explicitly. These rules will most likely be very similar to the operating system selection logic used in the Puppet module itself.

```ruby
supported_osmash = osmash.supported.dup
supported_osmash.map! { | os |
  case os['osfamily']{
    'Debian': {
      expectations = { 'expectations' => {
        'test_key' => 'expected_value'
      }
    }
    default = {
      expectations = { 'expectations' => {
        'test_key' => 'expected_value'
        }
      } 
    }
  }
  os.merge(expectations)
}
```

## Using an osmash library in tests

Do something clever extracting facts to set operating system specific facts in your `rspec_puppet` tests and then check that the module is setting them to the expected value for that OS. 

This needs to be tested before more can be written.

# Class `rspec_puppet_osmash`

This class is front-loaded so that the initialiser loads the module metadata and osmash library and processes all the results immediately. This should reduce access time for the resulting output and minimise recalculation.

## Initialise

The initialiser takes two optional parameters:

```ruby
osmash = Rspec_puppet_osmash.new(metadata_file_path,osmash_library_path)
```

### `metadata_file_path`

Sets the path to the `metadata.json` file for the Puppet Module

### `osmash_library_path`

Sets the path to a osmash library stored as a JSON file. A default osmash library is included and will be used if none is provided. This library contains a collection of operating systems with facts as expected from facter.

## Accessors

The values returned by the access methods are determined when first initialised, and just pull the processed data via access methods. 

### `rspec_puppet_osmash.all`

Outputs the loaded osmash OS library as an array of hashes.

### `rspec_puppet_osmash.supported`

Outputs an osmash library as array of hashes for all the operating systems from the loaded osmash library that are named as being supported in the `metadata.json` file for the Puppet module.

### `rspec_puppet_osmash.unsupported`

Outputs an osmash library as array of hashes for all the operating systems from the loaded osmash OS library that are _not_ named as being supported in the `metadata.json` file for the Puppet module.

### `rspec_puppet_osmash.known`

Outputs the loaded osmash OS library as an array of hashes. (_Note:_his seems to replicate `rspec_puppet_osmash.all` it needs checking.)

### `rspec_puppet_osmash.unknown`

Outputs the supported operating system metadata loaded from a module's `metadata.json` as a hash, but _only_ those OSes that can not be found in the loaded osmash library. (*WARNING:* It's not reliably doing operating system by release yet.)

### `rspec_puppet_osmash.metadata`

Outputs a hash of the metadata loaded from the `metadata.json` file for the Puppet module.

### `rspec_puppet_osmash.osmetadata`

Outputs a hash of all the supported operating system metadata loaded from the `metadata.json` file for the Puppet module.

# Licensing

This file is part of the rspec-puppet-osmash gem.

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

