class CpuMonitorController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
    @max_cpu_action = CpuMonitorRepository.cpu_action_config.to_s
    @infos = CpuInfo.all.sort(&sort_block)
  end

  def update
    begin
      info = CpuInfo.create(params)
      render json: { code: 0, message: 'Success!', action: info.action }
    rescue Exception => e
      render json: { code: 1, message: e.message }
    end
  end

  def action_config
    begin
      max_cpu_usage = params['max_cpu_usage_without_action'] || 0
      CpuMonitorRepository.cpu_action_config = max_cpu_usage.to_i
      redirect_to(root_path)
    rescue Exception => e
      redirect_to(root_path, alert: e.message)
    end

  end

  private

  def helper
    CpuMonitorHelper
  end

  def sort_block
    helper.sort_block(params['sort'])
  end

end