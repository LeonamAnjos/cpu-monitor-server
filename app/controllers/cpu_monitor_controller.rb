class CpuMonitorController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
    @infos = CpuInfo.all
  end

  def update
    begin
      info = CpuInfo.create(params)
      render json: { code: 0, message: 'Success!', action: info.action }
    rescue Exception => e
      render json: { code: 1, message: e.message }
    end
  end

end