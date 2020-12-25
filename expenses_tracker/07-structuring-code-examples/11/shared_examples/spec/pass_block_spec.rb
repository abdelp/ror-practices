require 'tempfile'

RSpec.describe FileKVStore do
  it_behaves_like 'KV store' do
    let(:tempfile) { Tempfile.new('kv.store') }
    let(:kv_store) { FileKVStore.new(tempfile.path) }
  end
end
