require 'cpu_monitor_repository'
class CpuInfo

  MAX_CPU_USAGE_BEFORE_REBOOT = 90

  attr_reader :id, :hostname, :created_at, :cpu, :disk, :process

  def self.create(values)
    CpuInfo.new(values).save
  end

  def self.all
    repo.all
  end

  def initialize(values = {})
    @id = values[:id]
    @hostname = values[:hostname]

    initialize_created_at(values[:created_at])

    if values[:report].nil?
      initialize_report_info(values)
    else
      initialize_report_info(values[:report])
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

  def initialize_report_info(values)
    @cpu = values[:cpu]
    @disk = values[:disk]
    @process = values[:process]
  end

  def initialize_created_at(date)
    if date.nil?
      @created_at =  Time.now
    elsif date.is_a?(Time)
      @created_at = date
    else
      @created_at = Time.parse(date)
    end
  end

  def repo
    CpuInfo.repo
  end

  def self.repo
    @@repo ||= CpuMonitorRepository
  end

end