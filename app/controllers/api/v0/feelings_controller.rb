class Api::V0::FeelingsController < ApplicationController

  def create
    scale = Scale.find_by_id(feeling_params[:scale_id])
    feeling = scale.feelings.build(:adjective => feeling_params[:feeling_adjective])

    if feeling.save
      render json: {:errors => false}, status: :created
    else
      render json: {:errors => feeling.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def feeling_params
    params.permit(:scale_id, :feeling_adjective)
  end
end
