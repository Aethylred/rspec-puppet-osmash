class Rspec_puppet_osmash

  require 'json'
  require 'set'

  def initialize (metadata_file_path = '../metadata.json')

    metadata_file = File.read( metadata_file_path )
    @metadata = JSON.parse( metadata_file )

    @osmash = {
      'el4'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'RedHat',
          :kernel          => 'Linux',
          :release         => '4',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'el5'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'RedHat',
          :kernel          => 'Linux',
          :release         => '5',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'el6'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'RedHat',
          :kernel          => 'Linux',
          :release         => '6',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'el7'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'RedHat',
          :kernel          => 'Linux',
          :release         => '7',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'centos4'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'CentOS',
          :kernel          => 'Linux',
          :release         => '4',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'centos5'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'CentOS',
          :kernel          => 'Linux',
          :release         => '5',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'centos6'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'CentOS',
          :kernel          => 'Linux',
          :release         => '6',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'centos7'                =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'CentOS',
          :kernel          => 'Linux',
          :release         => '7',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'fedora17'           =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'Fedora',
          :kernel          => 'Linux',
          :release         => '17',
          :releasetype     => 'lsbdistrelease',
        },
      'fedora_rawhide'           =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'Fedora',
          :kernel          => 'Linux',
          :release         => 'Rawhide',
          :releasetype     => 'lsbdistrelease',
        },
      'fedora21'           =>
        { :osfamily        => 'RedHat',
          :operatingsystem => 'Fedora',
          :kernel          => 'Linux',
          :release         => '21',
          :releasetype     => 'lsbdistrelease',
        },
      'freebsd8'          =>
        { :osfamily        => 'FreeBSD',
          :operatingsystem => 'FreeBSD',
          :kernel          => 'FreeBSD',
          :release         => '8',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'freebsd9'          =>
        { :osfamily        => 'FreeBSD',
          :operatingsystem => 'FreeBSD',
          :kernel          => 'FreeBSD',
          :release         => '9',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'freebsd10'          =>
        { :osfamily        => 'FreeBSD',
          :operatingsystem => 'FreeBSD',
          :kernel          => 'FreeBSD',
          :release         => '10',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'suse8'              =>
        { :osfamily        => 'Suse',
          :operatingsystem => 'Suse',
          :release         => '8',
          :releasetype     => 'lsbmajdistrelease',
        },
      'suse9'              =>
        { :osfamily        => 'Suse',
          :operatingsystem => 'Suse',
          :release         => '9',
          :releasetype     => 'lsbmajdistrelease',
        },
      'suse10'             =>
        { :osfamily        => 'Suse',
          :operatingsystem => 'Suse',
          :release         => '10',
          :releasetype     => 'lsbmajdistrelease',
        },
      'suse11'             =>
        { :osfamily        => 'Suse',
          :operatingsystem => 'Suse',
          :release         => '11',
          :releasetype     => 'lsbmajdistrelease',
        },
      'suse12'             =>
        { :osfamily        => 'Suse',
          :operatingsystem => 'Suse',
          :release         => '12',
          :releasetype     => 'lsbmajdistrelease',
         },
      'suse13'             =>
        { :osfamily        => 'Suse',
          :operatingsystem => 'Suse',
          :release         => '13',
          :releasetype     => 'lsbmajdistrelease',
        },
      'solaris8'           =>
        { :osfamily        => 'Solaris',
          :operatingsystem => 'Solaris',
          :release         => '5.8',
          :releasetype     => 'kernelrelease',
        },
      'solaris9'           =>
        { :osfamily        => 'Solaris',
          :operatingsystem => 'Solaris',
          :release         => '5.9',
          :releasetype     => 'kernelrelease',
        },
      'solaris10'          =>
        { :osfamily        => 'Solaris',
          :operatingsystem => 'Solaris',
          :release         => '5.10',
          :releasetype     => 'kernelrelease',
        },
      'solaris11'          =>
        { :osfamily        => 'Solaris',
          :operatingsystem => 'Solaris',
          :release         => '5.11',
          :releasetype     => 'kernelrelease',
        },
      'debian6'            =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Debian',
          :kernel          => 'Linux',
          :release         => '6',
          :codename        => 'Lenny',
          :lsbdistid       => 'Debian',
          :releasetype     => 'lsbdistid',
        },
      'debian7'            =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Debian',
          :kernel          => 'Linux',
          :release         => '7',
          :codename        => 'Wheezy',
          :lsbdistid       => 'Debian',
          :releasetype     => 'lsbdistid',
        },
      'debian7'            =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Debian',
          :kernel          => 'Linux',
          :release         => '8',
          :codename        => 'Jessie',
          :lsbdistid       => 'Debian',
          :releasetype     => 'lsbdistid',
        },
      'ubuntu1004'         =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Ubuntu',
          :kernel          => 'Linux',
          :lsbdistid       => 'Ubuntu',
          :release         => '10.04',
          :codename        => 'Lucid Lynx',
          :releasetype     => 'lsbdistid',
          :longservice     => true,
        },
      'ubuntu1104'         =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Ubuntu',
          :kernel          => 'Linux',
          :lsbdistid       => 'Ubuntu',
          :release         => '11.04',
          :codename        => 'Natty Narwhal',
          :releasetype     => 'lsbdistid',
        },
      'ubuntu1204'         =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Ubuntu',
          :kernel          => 'Linux',
          :lsbdistid       => 'Ubuntu',
          :release         => '12.04',
          :codename        => 'Precise Pangolin',
          :releasetype     => 'lsbdistrelease',
          :longservice     => true,
        },
      'ubuntu1304'         =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Ubuntu',
          :kernel          => 'Linux',
          :lsbdistid       => 'Ubuntu',
          :release         => '13.04',
          :codename        => 'Raring Ringtail',
          :releasetype     => 'lsbdistid',
        },
      'ubuntu1404'         =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Ubuntu',
          :kernel          => 'Linux',
          :lsbdistid       => 'Ubuntu',
          :release         => '14.04',
          :codename        => 'Trusty Tahr',
          :releasetype     => 'lsbdistrelease',
          :longservice     => true,
        },
      'ubuntu1504'         =>
        { :osfamily        => 'Debian',
          :operatingsystem => 'Ubuntu',
          :kernel          => 'Linux',
          :lsbdistid       => 'Ubuntu',
          :release         => '15.04',
          :codename        => 'Vivid Vervet',
          :releasetype     => 'lsbdistid',
        },
      'darwin'          =>
        { :osfamily        => 'Darwin',
          :operatingsystem => 'Darwin',
          :release         => '13',
          :releasetype     => 'operatingsystemmajrelease',
        },
      'unknown'          =>
        { :osfamily        => 'Unknown',
          :operatingsystem => 'Unknown',
          :release         => '99',
          :releasetype     => 'operatingsystemmajrelease',
        },
    }
  end

  def all
    @osmash
  end

  def metadata(key = 'all')
    if key == 'all'
      @metadata
    else
      @metadata[key]
    end
  end

  def osmetadata
    @metadata['operatingsystem_support']
  end

  def supported
    matches = Set.new
    @osmash.each do | os, values |
      @metadata['operatingsystem_support'].each do | metaos |
        if metaos['operatingsystem'] == values[:operatingsystem]
          if metaos['operatingsystemrelease'].include? values[:release]
            matches << os
          end
        end
      end
    end
    matches
  end

  def unsupported
    matches = Set.new
    @osmash.each do | os, values |
      @metadata['operatingsystem_support'].each do | metaos |
        if metaos['operatingsystem'] == values[:operatingsystem]
          if ! metaos['operatingsystemrelease'].include? values[:release]
            matches << os
          end
        else
          matches << os
        end
      end
    end
    matches
  end

  def unknown

  end

end
