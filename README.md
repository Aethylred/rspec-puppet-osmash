# `rspec-puppet-osmash`

[![Build Status](https://travis-ci.org/Aethylred/rspec-puppet-osmash.svg?branch=master)](https://travis-ci.org/Aethylred/rspec-puppet-osmash)

The purpose of this gem is to generate a library of operating system facts (an _osmash library_) from a Puppet Module metadata file (`metadata.json`) with some tools, functions and methods for use with [`rspec-puppet`](http://rspec-puppet.com/).

# Usage

## Initialising an osmash library

It is recommend that the osmash library for a Puppet module be initialised in `spec/rspec_helper.rb` and should automatically find `metadata.json` relative to this location. The osmash library needs to be a global variable so it is visible to the test scripts that will use it.

```ruby
$osmash = Rspec_puppet_osmash.new
```

## Adding expectations

This should then be run through something to attach some `expectations` to each operating system, these expectations should be added using _rules_ rather than explicitly. These rules will most likely be very similar to the operating system selection logic used in the Puppet module itself. A working example can be seen in the [`Aethylred/puppet-postfix` module](https://github.com/Aethylred/puppet-postfix/blob/osmash/spec/spec_helper.rb).

```ruby
# Adding expectations to the supported operating systems
$osmash.supported.map! do | os |
  # These expectations are shared across all supported OSes
  expectations = {
    'sendmail_package'   => 'sendmail',
    'sendmailcf_package' => 'sendmail-cf',
    'sendmail_service'   => 'sendmail'
  }

  # These cases merges in the OS specific expectations
  # The selection structure should be similar to what is used in the module
  case os['osfamily']
  when 'Debian'
    expectations.merge!( {
      'sendmail_ensure'  => 'purged',
      'package'          => 'postfix',
      'service'          => 'postfix',
      'config_file'      => '/etc/postfix/main.cf'
    } )
  when 'RedHat'
    expectations.merge!( {
      'sendmail_ensure'  => 'absent',
      'package'          => 'postfix',
      'service'          => 'postfix',
      'config_file'      => '/etc/postfix/main.cf'
    } )
  end

  # The expectations are then merged with the OS and passed back up to the map
  os.merge( { 'expectations' => expectations } )
end
```

## Using an osmash library in tests

Operating system specific tests now take the form of iterating over the osmash library of supported operating systems (or the _unsupported_ operating systems for extreme thoroughness). A complete example is given in [`Aethylred/puppet-postfix` module](https://github.com/Aethylred/puppet-postfix/blob/osmash/spec/classes/postfix_spec.rb), from which a partial implementation is shown below.

```ruby
# spec_helper populates $osmash consistently for every script
require 'spec_helper'

describe 'postfix', :type => :class do
  $osmash.supported.each do |os|
    context "on #{os['name']}" do
      let :facts do
        {
          :osfamily => os['osfamily'],
        }
      end
      it { should contain_class('postfix::params') }
      it { should contain_package(os['expectations']['package']) }
      it { should contain_service(os['expectations']['service']) }

      describe 'with no parameters' do
        it { should_not contain_service(os['expectations']['sendmail_service']) }
        it { should_not contain_package(os['expectations']['sendmail_package']) }
        it { should_not contain_package(os['expectations']['sendmailcf_package']) }
      end

      describe 'when removing sendmail' do
        let :params do
          { :remove_sendmail => true }
        end
        it { should contain_service(os['expectations']['sendmail_service']).with_ensure('stopped') }
        it { should contain_package(os['expectations']['sendmail_package']).with_ensure(os['expectations']['sendmail_ensure']) }
        it { should contain_package(os['expectations']['sendmailcf_package']).with_ensure(os['expectations']['sendmail_ensure']) }
      end

      describe 'when leaving sendmail alone' do
        let :params do
          { :remove_sendmail => false }
        end
        it { should_not contain_service(os['expectations']['sendmail_service']) }
        it { should_not contain_package(os['expectations']['sendmail_package']) }
        it { should_not contain_package(os['expectations']['sendmailcf_package']) }
      end
    end
  end
  
  context 'on a Unkown OS' do
    let :facts do
      {
        :osfamily => 'Unknown',
      }
    end
    it { should raise_error(Puppet::Error,
      %r{The postfix module does not support the Unknown family of operating systems.}
    ) }
  end

end
```


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

