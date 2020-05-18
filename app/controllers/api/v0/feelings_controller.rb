class Api::V0::FeelingsController < ApplicationController
  def create
    scale = Scale.find_by(feeling_params[:scale_id])
    feeling = scale.feelings.build(feeling_params[:feeling_adjective])
  end

  private
  def feeling_params
    params.permit(:scale_id, :feeling_adjective)
  end
end
