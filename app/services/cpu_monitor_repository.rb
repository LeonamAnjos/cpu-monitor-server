require 'redis'

module CpuMonitorRepository

  def CpuMonitorRepository.save(info)
    set(info.id, info.to_json)
  end

  def CpuMonitorRepository.set(key, value)
    repo.set key, value
  end

  def CpuMonitorRepository.get(key)
    repo.get key
  end

  def CpuMonitorRepository.repo
    @repo ||= Redis.new
  end

end