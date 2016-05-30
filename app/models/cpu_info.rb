require 'cpu_monitor_repository'
class CpuInfo

  def self.create_or_update(cpu_info)
    CpuMonitorRepository.set cpu_info[:id], cpu_info
  end

  def self.action_for(cpu_info)
    report = cpu_info[:report]
    return :reboot if report[:cpu] > 1
    :none
  end

end