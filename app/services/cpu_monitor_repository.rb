require 'redis'

module CpuMonitorRepository

  CPU_INFO_KEY = 'crossover:cpuinfo'

  def CpuMonitorRepository.save(info)
    repo.hset(CPU_INFO_KEY, info.id, info.to_json)
    true
  end

  def CpuMonitorRepository.repo
    @repo ||= Redis.new
  end

end