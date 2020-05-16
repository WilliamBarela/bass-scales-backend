class Api::V0::ScalesController < ApplicationController
  def show
    scale = Scale.find_by(id: params[:id])
    feelings = scale.feelings
    render json: ScaleSerializer.new(scale).to_serialized_json
  end
end
