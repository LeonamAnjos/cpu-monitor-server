require 'rails_helper'

describe CpuMonitorRepository do
  subject(:repo) { CpuMonitorRepository }
  let(:key) { CpuMonitorRepository::CPU_INFO_KEY }
  let(:info) { build(:cpu_info) }

  before do
    redis = double()
    expect(Redis).to receive(:new).and_return redis
    allow(redis).to receive(:hset).with(key, info.id, info.to_json)  { true }
  end

  it 'should save cpu info' do
    expect(repo.save(info)).to be true
  end

end