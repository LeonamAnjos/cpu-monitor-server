[ {id: '1', hostname: 'host1', report: { cpu: 12.5, disk: 19.4, process: [%w{/proc1 2.3}, %w{/proc2 3.1} ] } },
  {id: '2', hostname: 'host2', report: { cpu: 2.5, disk: 39.2, process: [%w{/proc1 1.7}, %w{/proc2 6.1} ] } },
  {id: '3', hostname: 'host3', report: { cpu: 1.4, disk: 32.1, process: [%w{/proc1 5.5} ] } },
  {id: '4', hostname: 'host4', report: { cpu: 51.7, disk: 1.4, process: [%w{/proc1 7.6}, %w{/proc2 9.1} ] } },
  {id: '5', hostname: 'host5', report: { cpu: 92.5, disk: 79.5, process: [%w{/proc1 82.3}, %w{/proc2 73.1}, %w{/proc3 7.1} ] } }
].each { |info| CpuInfo.create(info) }






