require 'spec_helper'

describe Rspec_puppet_osmash do

  context 'with no arguments' do
    osmash = Rspec_puppet_osmash.new
    it 'should have loaded an osmash library' do
      expect(osmash.all)
    end
    it 'should have loaded module metadata' do
      expect(osmash.metadata)
    end
    it 'should have extracted the supported operating sytems metadata' do
      expect(osmash.osmetadata)
    end
    it 'should have created an osmash library of supported operating systems from the module metadata' do
      expect(osmash.supported)
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
