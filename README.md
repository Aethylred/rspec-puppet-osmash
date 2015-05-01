# `rspec-puppet-osmash`

The purpose of this gem is to provide a hash of Operating Systems with some tools, functions and methods for use with rspec-puppet.

# Some really basic documentation written in a rush and is probably wrong

I recommend putting it in a puppet module's `spec/rspec_helper.rb` which should look for `metadata.json` relative to this.

```ruby
osmash = Rspec_puppet_osmash.new
```

This should then be run through something to attach some `expectations` to each operating system, these expectations should be added using _rules_ rather than explicitly.

```ruby
supported_osmash = osmash.supported
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

Then do something clever extracting facts to set operating system specific facts in your `rspec_puppet` tests and then check that the module is setting them to the expected value for that OS. This needs more words, but I have none at 5pm on a Friday.

## Initialise

The initialiser takes two parameters:

### `metadata_file_path`

Sets the path to the module's `metadata.json` file

### `osmash_library_path`

Sets the path to a osmash OS library JSON file. A defaul library is included. This library contains a collection of OSes with facts as expected from facter.

## Accessors

This should do all the work when initialises, and just pull the processed data via access methods.

### `osmash.all`

Outputs an osmash library as array of hashes for all the operating systems from the loaded osmash OS library

### `osmash.supported`

Outputs an osmash library as array of hashes for all the operating systems from the loaded osmash OS library that are named as being supported in a modules `metadata.json`

### `osmash.unsupported`

Outputs an osmash library as array of hashes for all the operating systems from the loaded osmash OS library that are _not_ named as being supported in a modules `metadata.json`.

### `osmash.known`

Outputs an osmash library as array of hashes for all the operating systems from the loaded osmash OS library. Yes this seems to replicate `osmash.all` it needs checking.

### `osmash.unknown`

Outputs the supported operating system metadata loaded from a module's `metadata.json` as a hash, but _only_ those OSes that osmash can not find in it's library. *NOTE:* It's not reliably doing operating system by release yet.

### `osmash.metadata`

Outputs the metadata loaded from a module's `metadata.json` as a hash.

### `osmash.osmetadata`

Outputs all the supported operating system metadata loaded from a module's `metadata.json` as a hash.

# Licensing

This file is part of the rspec-puppet-osmash gem.

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

