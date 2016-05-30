require 'redis'

module CpuMonitorRepository

  CPU_INFO_KEY = 'crossover:cpuinfo'

  def CpuMonitorRepository.save(info)
    repo.hset(CPU_INFO_KEY, info.id, info.to_json)
    true
  end

  def CpuMonitorRepository.all
    repo.hvals(CPU_INFO_KEY).map{|i| CpuInfo.new(JSON.parse(i).deep_symbolize_keys)  }
  end

  def CpuMonitorRepository.repo
    @repo ||= Redis.new
  end

  def CpuMonitorRepository.repo=(repo)
    @repo = repo
  end

end