module CpuMonitorHelper

  SORT_RULE = {
      id: lambda { |a,b| a.id <=> b.id },
      hostname: lambda { |a,b| a.hostname <=> b.hostname },
      date: lambda { |a,b| a.created_at <=> b.created_at },
      cpu: lambda { |a,b| a.cpu <=> b.cpu },
      disk: lambda { |a,b| a.disk <=> b.disk }
  }

  def CpuMonitorHelper.sort_block(sort)
    s = sort  || 'id'
    SORT_RULE[s.to_sym]
  end

end
