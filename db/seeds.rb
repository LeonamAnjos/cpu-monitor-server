[ {id: '1', hostname: 'host1', report: { cpu: 12.5, disk: 19.4, process: [ %w{/procA 2.6}, %w{/procB 5.6} ] }},
  {id: '2', hostname: 'host2', report: { cpu: 2.5, disk: 39.2, process: [%w{/procC 3.3}] } },
  {id: '3', hostname: 'host3', report: { cpu: 1.4, disk: 32.1, process: [%w{/procD 3.5}, %w{/procE 5.4}, %w{/procF 6.2}] } },
  {id: '4', hostname: 'host4', report: { cpu: 51.7, disk: 1.4, process: [%w{/procG 3.1}, %w{/procH 2.2}] } },
  {id: '5', hostname: 'host5', report: { cpu: 92.5, disk: 79.5, process: [%w{/procI 9.1}, %w{/procJ 3.1}, %w{/procK 3.3}, %w{/procL 5.6}] } }
].each { |info| CpuInfo.create(info) }






