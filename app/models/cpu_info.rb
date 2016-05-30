require 'cpu_monitor_repository'
class CpuInfo

  MAX_CPU_USAGE_BEFORE_REBOOT = 90

  attr_reader :id, :hostname, :created_at, :cpu, :disk, :process

  def self.create(values)
    CpuInfo.new(values).save
  end

  def initialize(values = {})
    @id = values[:id]
    @hostname = values[:hostname]
    @created_at = DateTime.now

    unless values[:report].nil?
      @cpu = values[:report][:cpu]
      @disk = values[:report][:disk]
      @process = values[:report][:process]
    end
  end

  def action
    cpu > MAX_CPU_USAGE_BEFORE_REBOOT ? :reboot : :none
  end

  def save
    validate
    repo.save(self) ? self : nil
  end

  private

  def validate
    cant_be_nil = []
    cant_be_nil << :id if id.nil?
    cant_be_nil << :hostname if hostname.nil?
    cant_be_nil << :cpu if cpu.nil?
    cant_be_nil << :disk if disk.nil?
    cant_be_nil << :process if process.nil?

    raise "CPU info can't have these fields blank: #{cant_be_nil.inspect}" unless cant_be_nil.empty?
  end

  def repo
    @@repo ||= CpuMonitorRepository
  end


end