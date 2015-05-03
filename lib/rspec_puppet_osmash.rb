class Rspec_puppet_osmash

  require 'json'
  require 'set'

  def initialize (metadata_file_path = './metadata.json', osmash_library_path = 'default')

    metadata_file = File.read( metadata_file_path )
    @metadata = JSON.parse( metadata_file )

    if osmash_library_path == 'default'
      my_osmash_library = File.join(File.dirname(File.expand_path(__FILE__)), 'osmash.json')
    else
      my_osmash_library = osmash_library_path
    end

    osmash_library_file = File.read( my_osmash_library )
    @osmash = JSON.parse( osmash_library_file )

    @osmash.map! { |os|
      unless os['name']
        if os['codename'] 
          codename = "\"#{os['codename']}\" "
        else
          codename = ""
        end
        os.merge( { 'name' => "#{os['operatingsystem']} #{codename}#{os['release']}" } )
      else
        os
      end
    }

    matched = Set.new
    unmatched = Set.new
    @osmash.each do | os |
      if self.osmetadata.any? { |mos|
          mos['operatingsystem'] == os['operatingsystem'] and
          mos['operatingsystemrelease'].include? os['release']
      }
        matched << os
      else
        unmatched << os
      end
    end
    @supported = matched.to_a
    @unsupported = unmatched.to_a

    knownos = Set.new
    @osmash.each do | os |
      knownos << os
    end
    @known = knownos.to_a

    unknownos = self.osmetadata
    @osmash.each do | os |
      unknownos.delete_if { | mos |
        mos['operatingsystem'] == os['operatingsystem'] and
        mos['operatingsystemrelease'].include? os['release']
      }
    end
    @unknown = unknownos.to_a 
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
    @supported
  end

  def unsupported
    @unsupported
  end

  def known
    @known
  end

  def unknown
    @unknown
  end

end
