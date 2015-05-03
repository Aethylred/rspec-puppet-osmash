require 'spec_helper'

describe Rspec_puppet_osmash do

  context 'with no arguments' do
    osmash = Rspec_puppet_osmash.new
    it 'should have loaded an osmash library' do
      expect(osmash.all).to eq(
        [
          { "kernel"        => "Linux",
          "release"         => "4",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "el4",
          "osfamily"        => "RedHat",
          "operatingsystem" => "RedHat",
          "name"            => "RedHat 4"
          },
          { "kernel"        => "Linux",
          "release"         => "5",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "el5",
          "osfamily"        => "RedHat",
          "operatingsystem" => "RedHat",
          "name"            => "RedHat 5"
          },
          { "kernel"        => "Linux",
          "release"         => "6",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "el6",
          "osfamily"        => "RedHat",
          "operatingsystem" => "RedHat",
          "name"            => "RedHat 6"
          },
          { "kernel"        => "Linux",
          "release"         => "7",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "el7",
          "osfamily"        => "RedHat",
          "operatingsystem" => "RedHat",
          "name"            => "RedHat 7"
          },
          { "kernel"        => "Linux",
          "release"         => "4",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "centos4",
          "osfamily"        => "RedHat",
          "operatingsystem" => "CentOS",
          "name"            => "CentOS 4"
          },
          { "kernel"        => "Linux",
          "release"         => "5",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "centos5",
          "osfamily"        => "RedHat",
          "operatingsystem" => "CentOS",
          "name"            => "CentOS 5"
          },
          { "kernel"        => "Linux",
          "release"         => "6",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "centos6",
          "osfamily"        => "RedHat",
          "operatingsystem" => "CentOS",
          "name"            => "CentOS 6"
          },
          { "kernel"        => "Linux",
          "release"         => "7",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "centos7",
          "osfamily"        => "RedHat",
          "operatingsystem" => "CentOS",
          "name"            => "CentOS 7"
          },
          { "kernel"        => "Linux",
          "release"         => "17",
          "releasetype"     => "lsbdistrelease",
          "key"             => "fedora17",
          "osfamily"        => "RedHat",
          "operatingsystem" => "Fedora",
          "name"            => "Fedora 17"
          },
          { "kernel"        => "Linux",
          "release"         => "Rawhide",
          "releasetype"     => "lsbdistrelease",
          "key"             => "fedora_rawhide",
          "osfamily"        => "RedHat",
          "operatingsystem" => "Fedora",
          "name"            => "Fedora Rawhide"
          },
          { "kernel"        => "Linux",
          "release"         => "21",
          "releasetype"     => "lsbdistrelease",
          "key"             => "fedora21",
          "osfamily"        => "RedHat",
          "operatingsystem" => "Fedora",
          "name"            => "Fedora 21"
          },
          { "kernel"        => "FreeBSD",
          "release"         => "8",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "freebsd8",
          "osfamily"        => "FreeBSD",
          "operatingsystem" => "FreeBSD",
          "name"            => "FreeBSD 8"
          },
          { "kernel"        => "FreeBSD",
          "release"         => "9",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "freebsd9",
          "osfamily"        => "FreeBSD",
          "operatingsystem" => "FreeBSD",
          "name"            => "FreeBSD 9"
          },
          { "kernel"        => "FreeBSD",
          "release"         => "10",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "freebsd10",
          "osfamily"        => "FreeBSD",
          "operatingsystem" => "FreeBSD",
          "name"            => "FreeBSD 10"
          },
          { "release"       => "8",
          "releasetype"     => "lsbmajdistrelease",
          "key"             => "suse8",
          "osfamily"        => "Suse",
          "operatingsystem" => "Suse",
          "name"            => "Suse 8"
          },
          { "release"       => "9",
          "releasetype"     => "lsbmajdistrelease",
          "key"             => "suse9",
          "osfamily"        => "Suse",
          "operatingsystem" => "Suse",
          "name"            => "Suse 9"
          },
          { "release"       => "10",
          "releasetype"     => "lsbmajdistrelease",
          "key"             => "suse10",
          "osfamily"        => "Suse",
          "operatingsystem" => "Suse",
          "name"            => "Suse 10"
          },
          { "release"       => "11",
          "releasetype"     => "lsbmajdistrelease",
          "key"             => "suse11",
          "osfamily"        => "Suse",
          "operatingsystem" => "Suse",
          "name"            => "Suse 11"
          },
          { "release"       => "12",
          "releasetype"     => "lsbmajdistrelease",
          "key"             => "suse12",
          "osfamily"        => "Suse",
          "operatingsystem" => "Suse",
          "name"            => "Suse 12"
          },
          { "release"       => "13",
          "releasetype"     => "lsbmajdistrelease",
          "key"             => "suse13",
          "osfamily"        => "Suse",
          "operatingsystem" => "Suse",
          "name"            => "Suse 13"
          },
          { "release"       => "5.8",
          "releasetype"     => "kernelrelease",
          "key"             => "solaris8",
          "osfamily"        => "Solaris",
          "operatingsystem" => "Solaris",
          "name"            => "Solaris 5.8"
          },
          { "release"       => "5.9",
          "releasetype"     => "kernelrelease",
          "key"             => "solaris9",
          "osfamily"        => "Solaris",
          "operatingsystem" => "Solaris",
          "name"            => "Solaris 5.9"
          },
          { "release"       => "5.10",
          "releasetype"     => "kernelrelease",
          "key"             => "solaris10",
          "osfamily"        => "Solaris",
          "operatingsystem" => "Solaris",
          "name"            => "Solaris 5.10"
          },
          { "release"       => "5.11",
          "releasetype"     => "kernelrelease",
          "key"             => "solaris11",
          "osfamily"        => "Solaris",
          "operatingsystem" => "Solaris",
          "name"            => "Solaris 5.11"
          },
          { "kernel"        => "Linux",
          "release"         => "6",
          "releasetype"     => "lsbdistid",
          "key"             => "debian6",
          "osfamily"        => "Debian",
          "codename"        => "Lenny",
          "lsbdistid"       => "Debian",
          "operatingsystem" => "Debian",
          "name"            => "Debian \"Lenny\" 6"
          },
          { "kernel"        => "Linux",
          "release"         => "7",
          "releasetype"     => "lsbdistid",
          "key"             => "debian7",
          "osfamily"        => "Debian",
          "codename"        => "Wheezy",
          "lsbdistid"       => "Debian",
          "operatingsystem" => "Debian",
          "name"            => "Debian \"Wheezy\" 7"
          },
          { "kernel"        => "Linux",
          "release"         => "8",
          "releasetype"     => "lsbdistid",
          "key"             => "debian7",
          "osfamily"        => "Debian",
          "codename"        => "Jessie",
          "lsbdistid"       => "Debian",
          "operatingsystem" => "Debian",
          "name"            => "Debian \"Jessie\" 8"
          },
          { "kernel"        => "Linux",
          "release"         => "10.04",
          "releasetype"     => "lsbdistid",
          "key"             => "ubuntu1004",
          "osfamily"        => "Debian",
          "codename"        => "Lucid Lynx",
          "lsbdistid"       => "Ubuntu",
          "operatingsystem" => "Ubuntu",
          "name"            => "Ubuntu \"Lucid Lynx\" 10.04",
          "longservice"     => "true"
          },
          { "kernel"        => "Linux",
          "release"         => "11.04",
          "releasetype"     => "lsbdistid",
          "key"             => "ubuntu1104",
          "osfamily"        => "Debian",
          "codename"        => "Natty Narwhal",
          "lsbdistid"       => "Ubuntu",
          "operatingsystem" => "Ubuntu",
          "name"            => "Ubuntu \"Natty Narwhal\" 11.04"
          },
          { "kernel"        => "Linux",
          "release"         => "12.04",
          "releasetype"     => "lsbdistrelease",
          "key"             => "ubuntu1204",
          "osfamily"        => "Debian",
          "codename"        => "Precise Pangolin",
          "lsbdistid"       => "Ubuntu",
          "operatingsystem" => "Ubuntu",
          "name"            => "Ubuntu \"Precise Pangolin\" 12.04",
          "longservice"     => "true"
          },
          { "kernel"        => "Linux",
          "release"         => "13.04",
          "releasetype"     => "lsbdistid",
          "key"             => "ubuntu1304",
          "osfamily"        => "Debian",
          "codename"        => "Raring Ringtail",
          "lsbdistid"       => "Ubuntu",
          "operatingsystem" => "Ubuntu",
          "name"            => "Ubuntu \"Raring Ringtail\" 13.04"
          },
          { "kernel"        => "Linux",
          "release"         => "14.04",
          "releasetype"     => "lsbdistrelease",
          "key"             => "ubuntu1404",
          "osfamily"        => "Debian",
          "codename"        => "Trusty Tahr",
          "lsbdistid"       => "Ubuntu",
          "operatingsystem" => "Ubuntu",
          "name"            => "Ubuntu \"Trusty Tahr\" 14.04",
          "longservice"     => "true"
          },
          { "kernel"        => "Linux",
          "release"         => "15.04",
          "releasetype"     => "lsbdistid",
          "key"             => "ubuntu1504",
          "osfamily"        => "Debian",
          "codename"        => "Vivid Vervet",
          "lsbdistid"       => "Ubuntu",
          "operatingsystem" => "Ubuntu",
          "name"            => "Ubuntu \"Vivid Vervet\" 15.04"
          },
          { "release"       => "13",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "darwin",
          "osfamily"        => "Darwin",
          "operatingsystem" => "Darwin",
          "name"            => "Darwin 13"
          },
          { "release"       => "99",
          "releasetype"     => "operatingsystemmajrelease",
          "key"             => "unknown",
          "osfamily"        => "Unknown",
          "operatingsystem" => "Unknown",
          "name"            => "Unknown 99"
          }
        ]
      )
    end
    it 'should have loaded module metadata' do
      expect(osmash.metadata).to eq(
        {
          "issues_url"   => "https://github.com/Aethylred/rspec-puppet-osmash/issues",
          "source"       => "https://github.com/Aethylred/rspec-puppet-osmash.git",
          "requirements" => [
            {
              "version_requirement" => ">= 3.2.0 < 4.0.0",
              "name"                => "pe"
            },
            {
              "version_requirement" => ">= 3.0.0 < 4.0.0",
              "name"                => "puppet"
            }
          ],
          "license"      => "Apache-2.0",
          "version"      => "0.0.1",
          "dependencies" => [
            {
              "version_requirement" => ">= 4.0.0 < 5.0.0",
              "name"                => "puppetlabs/apache"
            }
          ],
          "project_page"            => "https://github.com/Aethylred/rspec-puppet-osmash",
          "summary"                 => "Metadata for testing",
          "operatingsystem_support" => [
            {
              "operatingsystemrelease" => ["9", "10", "11"],
              "operatingsystem"        => "Solaris"
            },
            {
              "operatingsystemrelease" => ["9", "10", "11", "12"],
              "operatingsystem"        => "SLED"
            }
          ],
          "description" => "Provides test metadata for testing metadata",
          "author"      => "Aethylred",
          "name"        => "test-metadata"
        }
      )
    end
    it 'should have extracted the supported operating sytems metadata' do
      expect(osmash.osmetadata).to eq(
        [
          {
            "operatingsystemrelease" => ["9", "10", "11"],
            "operatingsystem"        => "Solaris"
          },
          {
            "operatingsystemrelease" => ["9", "10", "11", "12"],
            "operatingsystem"        => "SLED"
          }
        ]
      )
    end
    it 'should have created an osmash library of supported operating systems from the module metadata' do
      expect(osmash.supported).to eq('foo')
    end
    it 'should have created an osmash library of unsupported operating systems that are not in the module metadata' do
      expect(osmash.unsupported)
    end
    it 'should make an osmash library of all supported operating systems' do
      expect(osmash.known)
    end
    it 'should list the operating systems from the module metadata that are not recognised' do
      expect(osmash.unknown)
    end
  end

end
