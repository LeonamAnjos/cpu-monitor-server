FactoryGirl.define do
  factory :cpu_info do
    initialize_with do
      CpuInfo.new({id: '123', hostname: 'my_host', report: { cpu: 12.5, disk: 19.4, process: [%w{/proc1 2.3}, %w{/proc2 3.1} ] } })
    end
  end

end