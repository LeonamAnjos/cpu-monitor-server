class CpuMonitorController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new { |c| puts c.request.inspect; c.request.format == 'application/json' }

  def index
  end

  def update
    #render json: { code: 0, message: 'Successfully updated!', action: :reboot }
    render json: { code: 0, message: 'Successfully updated!' }
  end

end