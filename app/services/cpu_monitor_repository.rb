require 'redis'

module CpuMonitorRepository

  CPU_INFO_KEY = 'crossover:cpuinfo'
  CPU_ACTION_KEY = 'crossover:cpuaction'

  def CpuMonitorRepository.save(info)
    repo.hset(CPU_INFO_KEY, info.id, info.to_json)
    true
  end

  def CpuMonitorRepository.all
    repo.hvals(CPU_INFO_KEY).map{|i| CpuInfo.new(JSON.parse(i).deep_symbolize_keys)  }
  end

  def CpuMonitorRepository.cpu_action_config=(usage)
    if usage > 0
      repo.set CPU_ACTION_KEY, usage
    else
      repo.del CPU_ACTION_KEY
    end
  end

  def CpuMonitorRepository.cpu_action_config
    repo.get(CPU_ACTION_KEY).to_i
  end

  def CpuMonitorRepository.repo
    @repo ||= Redis.new
  end

  def CpuMonitorRepository.repo=(repo)
    @repo = repo
  end

end