require 'rails_helper'
describe CpuInfo do
  context 'with invalid fields' do
    subject(:info) { CpuInfo.new }

    it 'should not save' do
      expect{info.save}.to raise_error(RuntimeError, 'CPU info can\'t have these fields blank: [:id, :hostname, :cpu, :disk, :process]')
    end
  end

  context 'with valid fields' do
    subject(:info) { CpuInfo.new(fields) }
    let(:fields) { {id: '123', hostname: 'my_host', report: { cpu: 12.5, disk: 19.4, process: [%w{/proc1 2.3}, %w{/proc2 3.1} ] } }  }

    its(:id) { is_expected.to be_eql '123' }
    its(:hostname) { is_expected.to be_eql 'my_host' }
    its(:cpu) { is_expected.to be_eql 12.5 }
    its(:disk) { is_expected.to be_eql 19.4 }
    its(:process) { is_expected.to be_eql [%w{/proc1 2.3}, %w{/proc2 3.1} ] }
    its(:created_at) { is_expected.not_to be_nil }

    it 'should save' do
      expect(CpuMonitorRepository).to receive(:save).with(info).and_return true
      expect(info.save).to be true
    end
  end
end