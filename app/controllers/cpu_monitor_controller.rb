class CpuMonitorController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
  end

  def update
    begin
      CpuInfo.create_or_update(params)
      # get action for params[:id]
      action = CpuInfo.action_for(params)
      # render code 0
      render json: { code: 0, message: 'Successfully updated!', action: action }
    rescue Exception => e
      render json: { code: 1, message: e.message }
    end
  end

end