class CpuMonitorController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:update]

  def index
  end

  def update
    #render json: { code: 0, message: 'Successfully updated!', action: :reboot }
    render json: { code: 0, message: 'Successfully updated!' }
  end

end