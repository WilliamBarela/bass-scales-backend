class Api::V0::ScalesController < ApplicationController
  def show
    scale = Scale.find_by(id: params[:id])
    feelings_limit = 10
    render json: ScaleSerializer.new(scale, feelings_limit).scale_feelings_json
  end
end
