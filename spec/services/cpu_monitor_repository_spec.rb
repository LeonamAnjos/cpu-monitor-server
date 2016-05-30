require 'rails_helper'

describe CpuMonitorRepository do
  subject(:repo) { CpuMonitorRepository }
  let(:key) { CpuMonitorRepository::CPU_INFO_KEY }
  let(:info) { build(:cpu_info) }

  before do
    repo.repo = double('redis')
    allow(repo.repo).to receive(:hset).with(key, info.id, info.to_json)  { true }
    allow(repo.repo).to receive(:hvals).with(key)  { [info.to_json] }
  end

  it 'should save cpu info' do
    expect(repo.save(info)).to be true
  end

  it 'should return a list of cpu info' do
    actual = repo.all
    expect(actual).not_to be_empty
    expect(actual.size).to eql 1
    expect(actual.first.id).to eql info.id
    expect(actual.first.hostname).to eql info.hostname
    expect(actual.first.cpu).to eql info.cpu
    expect(actual.first.disk).to eql info.disk
    expect(actual.first.process).to eql info.process
  end


end