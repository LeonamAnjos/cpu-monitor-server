[ {id: '1', hostname: 'host1', report: { cpu: 12.5, disk: 19.4, process: %w{/procA /procB} }},
  {id: '2', hostname: 'host2', report: { cpu: 2.5, disk: 39.2, process: %w{/procC} } },
  {id: '3', hostname: 'host3', report: { cpu: 1.4, disk: 32.1, process: %w{/procD /procE /procF} } },
  {id: '4', hostname: 'host4', report: { cpu: 51.7, disk: 1.4, process: %w{/procG /procH} } },
  {id: '5', hostname: 'host5', report: { cpu: 92.5, disk: 79.5, process: %w{/procI /procJ /procK /procL} } }
].each { |info| CpuInfo.create(info) }






