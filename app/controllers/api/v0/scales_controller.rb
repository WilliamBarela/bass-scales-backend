class Api::V0::ScalesController < ApplicationController
  def show
    scale = Scale.find_by(id: params[:id])
    feelings = scale.feelings
     render json: {
       data: {
         scale: {
           id: scale.id,
           root: scale.root,
           mode: scale.mode
         },
         feelings: feelings.collect do |f| 
           {
             id: f.id,
             adjective: f.adjective,
             scale_id: f.scale_id
           }
         end
       }
     }
  end
end
